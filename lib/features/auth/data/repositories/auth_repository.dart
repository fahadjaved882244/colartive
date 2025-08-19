import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import '../../model/auth_user.dart';
import '../utils/auth_exceptions.dart';
import 'i_auth_repository.dart';

class AuthRepository extends IAuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  AuthUser? get currentUser => _firebaseAuth.currentUser?.toAppUser;

  @override
  Stream<AuthUser?> get authStateChange =>
      _firebaseAuth.userChanges().map((u) => u.toAppUser);

  @override
  Future<void> signup({
    required String email,
    required String password,
    required Map<String, dynamic> body,
  }) async {
    try {
      final cred = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await cred.user!.updateDisplayName(body['name']);
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        throw EmailInUseException(code: e.code);
      } else {
        throw ServerException(code: e.code);
      }
    }
  }

  @override
  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
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
  Future<void> updateEmail(
      {required String newEmail, required String password}) async {
    try {
      await _reAuthenticate(password);
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        // await user.updateEmail(newEmail);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use" || e.code == "invalid-email") {
        throw EmailInUseException(code: e.code);
      } else {
        throw ServerException(code: e.code, message: e.message);
      }
    }
  }

  @override
  Future<void> changePassword(
      {required String oldPassword, required String newPassword}) async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      try {
        await _reAuthenticate(oldPassword);
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
  Future<void> verifyEmail() async {
    final user = _firebaseAuth.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  @override
  Future<void> externalSignIn(authCred) async {
    try {
      await _firebaseAuth.signInWithCredential(
        authCred as OAuthCredential,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == "account-exists-with-different-credential") {
        throw EmailInUseException(code: e.code);
      } else if (e.code == "operation-not-allowed") {
        throw AccountLockedException(code: e.code);
      } else {
        throw ServerException(code: e.code);
      }
    }
  }

  Future<void> _reAuthenticate(String password) async {
    final user = _firebaseAuth.currentUser;
    if (user != null && user.email != null) {
      final authCred = EmailAuthProvider.credential(
        email: user.email!,
        password: password,
      );
      try {
        await user.reauthenticateWithCredential(authCred);
      } on FirebaseAuthException catch (e) {
        if (e.code == "user-mismatch" ||
            e.code == "wrong-password" ||
            e.code == "invalid-credential") {
          throw PasswordException(code: e.code);
        } else if (e.code == "user-not-found") {
          throw NoUserFoundException(code: e.code);
        } else {
          throw ServerException(code: e.code, message: e.message);
        }
      }
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<bool> uploadProfileImage(File profileImage) {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      // user.updatePhotoURL(photoURL);
    }
    throw UnimplementedError();
  }

  @override
  Future<void> verifyPhone(
      {required String phoneNumber,
      required void Function(dynamic authCred) verificationCompleted,
      required void Function(Exception p1) verificationFailed,
      required void Function(String p1, int? p2) codeSent,
      required void Function(String p1) codeAutoRetrievalTimeout}) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateName(String name) async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      await user.updateDisplayName(name);
    }
  }
}

extension AppUser on User? {
  AuthUser? get toAppUser {
    if (this != null && this!.email != null && this!.displayName != null) {
      return AuthUser(
        id: this!.uid,
        email: this!.email!,
        name: this!.displayName!,
        isVerified: this!.emailVerified,
      );
    } else {
      return null;
    }
  }
}
