import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';

import '../../services/auth/auth_exceptions.dart';
import '../../services/auth/i_auth_provider.dart';
import '../models/user.dart';
import 'user_provider.dart';

class AuthProvider implements IAuthProvider {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final UserProvider _firebaseUserProvider;
  AuthProvider(this._firebaseUserProvider);

  @override
  Future<UserModel?> getUser({String? token}) async {
    UserModel? user;
    final firebaseUser = _firebaseAuth.currentUser;
    if (firebaseUser != null) {
      user = await _firebaseUserProvider.read(firebaseUser.uid);
    }
    return user;
  }

  @override
  Future<void> verifyPhone({
    required String phoneNumber,
    required void Function(PhoneAuthCredential) verificationCompleted,
    required void Function(FirebaseAuthException) verificationFailed,
    required void Function(String, int?) codeSent,
    required void Function(String) codeAutoRetrievalTimeout,
  }) async {
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 60),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  @override
  Future<bool> addPhoneNumber(String phoneNumber) async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      final status = await _firebaseUserProvider.update(
        user.uid,
        {
          "phoneNumber": phoneNumber,
        },
      );
      return status;
    } else {
      return false;
    }
  }

  @override
  Future<UserModel?> signup({
    required String email,
    required String password,
    required Map<String, dynamic> body,
  }) async {
    try {
      UserModel? user;
      final cred = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (cred.user != null) {
        final userModel = UserModel(
          id: cred.user!.uid,
          email: email,
          firstName: body['firstName'],
          lastName: body['lastName'],
          phoneNumber: body['phoneNumber'],
          isVerified: cred.user!.emailVerified,
          dateAdded: DateTime.now(),
          lastUpdated: DateTime.now(),
          accountStatus: AccountStatus.active,
        );
        await cred.user!.sendEmailVerification();
        if (await _firebaseUserProvider.create(userModel)) {
          user = userModel;
        }
      }
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        throw EmailException(code: e.code);
      } else {
        throw ServerException(code: e.code);
      }
    }
  }

  @override
  Future<UserModel?> login({
    required String email,
    required String password,
  }) async {
    try {
      UserModel? user;
      final cred = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (cred.user != null) {
        user = await _firebaseUserProvider.read(cred.user!.uid);
      }
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-disabled") {
        throw AccountLockedException(code: e.code);
      } else if (e.code == "user-not-found" || e.code == "wrong-password") {
        throw CredentialException(code: e.code);
      } else {
        throw ServerException(code: e.code, message: e.message);
      }
    }
  }

  @override
  Future<bool> updateUser(String uid, Map<String, Object?> data) async {
    return _firebaseUserProvider.update(uid, data);
  }

  @override
  Future<void> updateEmail(String newEmail, String password) async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      final authCred = EmailAuthProvider.credential(
        email: user.email!,
        password: password,
      );
      try {
        await user.reauthenticateWithCredential(authCred);
        await user.updateEmail(newEmail);
        await _firebaseUserProvider.update(user.uid, {
          "email": newEmail,
          "isVerified": false,
        });
        await user.sendEmailVerification();
      } on FirebaseAuthException catch (e) {
        if (e.code == "user-not-found" ||
            e.code == "wrong-password" ||
            e.code == "invalid-credential") {
          throw PasswordException(code: e.code);
        } else if (e.code == "email-already-in-use") {
          throw EmailException(code: e.code);
        } else {
          throw ServerException(code: e.code, message: e.message);
        }
      }
    }
  }

  @override
  Future<void> changePassword(String oldPassword, String newPassword) async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      final cred = EmailAuthProvider.credential(
        email: user.email!,
        password: oldPassword,
      );
      try {
        await user.reauthenticateWithCredential(cred);
        await user.updatePassword(newPassword);
      } on FirebaseAuthException catch (e) {
        if (e.code == "user-not-found" ||
            e.code == "wrong-password" ||
            e.code == "invalid-credential") {
          throw PasswordException(code: e.code);
        } else {
          throw ServerException(code: e.code, message: e.message);
        }
      }
    }
  }

  @override
  Future<void> forgotPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      if (e.code == "auth/user-not-found") {
        throw NoUserFoundException(code: e.code);
      } else {
        throw ServerException(code: e.code, message: e.message);
      }
    }
  }

  @override
  Future<bool> verifyEmail() async {
    final user = _firebaseAuth.currentUser;
    if (user != null && user.emailVerified) {
      await updateUser(user.uid, {"isVerified": true});
      return true;
    } else {
      await user!.sendEmailVerification();
      return false;
    }
  }

  @override
  Future<bool> uploadProfileImage(
    int userId,
    File profileImage,
    String? oldImage,
  ) async {
    return false;
  }

  @override
  Future<UserModel?> externalSignIn(authCred) async {
    return null;

    // try {
    //   UserModel? user;
    //   final cred =
    //       await _firebaseAuth.signInWithCredential(authCred as OAuthCredential);
    //   if (cred.user != null) {
    //     user = await _firebaseUserProvider.read(cred.user!.uid);
    //     if (user == null) {
    //   user = UserModel(
    //     id: cred.user!.uid,
    //     email: cred.user!.email!,
    //     firstName: cred.user!.displayName ?? "N/A",

    //     photoUrl: cred.user!.photoURL,
    //     phoneNumber: cred.user!.phoneNumber,
    //     isVerified: cred.user!.emailVerified,
    //     restaurantIdList: [],
    //     butcherIdList: [],
    //     storeIdList: [],
    //     dateAdded: DateTime.now(),
    //     lastUpdated: DateTime.now(),
    //     accountStatus: AccountStatus.active,
    //   );
    //   await _firebaseUserProvider.create(user);
    // }
    //   }
    //   return user;
    // } on FirebaseAuthException catch (e) {
    //   if (e.code == "account-exists-with-different-credential") {
    //     throw EmailException(code: e.code);
    //   } else if (e.code == "operation-not-allowed") {
    //     throw AccountLockedException(code: e.code);
    //   } else {
    //     throw ServerException(code: e.code);
    //   }
    // }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<String?> getToken(String uid) async {
    return _firebaseUserProvider.getToken(uid);
  }
}
