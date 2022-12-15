import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import '../../data/models/user.dart';

abstract class IAuthProvider {
  Future<UserModel?> getUser({String? token});

  Future<void> verifyPhone({
    required String phoneNumber,
    required void Function(PhoneAuthCredential) verificationCompleted,
    required void Function(FirebaseAuthException) verificationFailed,
    required void Function(String, int?) codeSent,
    required void Function(String) codeAutoRetrievalTimeout,
  });

  Future<bool> addPhoneNumber(String phoneNumber);

  Future<UserModel?> signup({
    required String email,
    required String password,
    required Map<String, dynamic> body,
  });

  Future<UserModel?> login({required String email, required String password});

  Future<bool> updateUser(String uid, Map<String, Object?> data);

  Future<void> updateEmail(String newEmail, String password);

  Future<bool> verifyEmail();

  Future<void> changePassword(String oldPassword, String newPassword);

  Future<void> forgotPassword(String email);

  Future<bool> uploadProfileImage(
      int userId, File profileImage, String? oldImage);

  Future<UserModel?> externalSignIn(authCred);

  Future<void> signOut();

  Future<String?> getToken(String uid);
}
