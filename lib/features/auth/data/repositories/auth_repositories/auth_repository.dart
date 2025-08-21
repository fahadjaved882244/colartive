import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../model/app_user.dart';
import '../../utils/auth_exceptions.dart';
import 'i_auth_repository.dart';

class AuthRepository extends IAuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  AppUser? get currentUser => _firebaseAuth.currentUser?.toAppUser;

  @override
  Stream<AppUser?> get authStateChange =>
      _firebaseAuth.authStateChanges().map((u) => u.toAppUser);

  @override
  Future<AppUser?> signup({
    required String email,
    required String password,
    required Map<String, dynamic> body,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (body['name'] != null) {
        await _firebaseAuth.currentUser?.updateDisplayName(body['name']);
      }
      _firebaseAuth.currentUser?.sendEmailVerification();
      return _firebaseAuth.currentUser?.toAppUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        throw EmailInUseException(code: e.code);
      } else {
        throw ServerException(code: e.code);
      }
    }
  }

  @override
  Future<AppUser?> login({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _firebaseAuth.currentUser?.toAppUser;
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
        await user.verifyBeforeUpdateEmail(newEmail);
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
  Future<bool> uploadProfileImage(File profileImage) async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      await user.updatePhotoURL(profileImage.path);
      return true; // Indicate success
    }
    throw NoUserFoundException(code: "No user is currently signed in.");
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
  Future<String?> updateName(String name) async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      await user.updateDisplayName(name);
      return user.uid;
    }
    return null;
  }
}

extension AppUserX on User? {
  AppUser? get toAppUser {
    if (this != null) {
      return AppUser(
        id: this!.uid,
        email: this!.email!,
        name: this!.displayName,
        imageUrl: this!.photoURL,
        isVerified: this!.emailVerified,
        createdAt: this!.metadata.creationTime ?? DateTime.now(),
        lastActiveAt: this!.metadata.lastSignInTime ?? DateTime.now(),
      );
    } else {
      return null;
    }
  }
}
