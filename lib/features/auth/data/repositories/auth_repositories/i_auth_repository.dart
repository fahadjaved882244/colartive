import 'dart:io';
import '../../../model/app_user.dart';

abstract class IAuthRepository {
  AppUser? get currentUser;

  Stream<AppUser?> get authStateChange;

  Future<AppUser?> signup({
    required String email,
    required String password,
    required Map<String, dynamic> body,
  });

  Future<AppUser?> login({required String email, required String password});

  Future<void> verifyPhone({
    required String phoneNumber,
    required void Function(dynamic authCred) verificationCompleted,
    required void Function(Exception) verificationFailed,
    required void Function(String, int?) codeSent,
    required void Function(String) codeAutoRetrievalTimeout,
  });

  Future<void> updateEmail(
      {required String newEmail, required String password});

  Future<void> verifyEmail();

  Future<void> changePassword(
      {required String oldPassword, required String newPassword});

  Future<void> forgotPassword(String email);

  Future<void> externalSignIn(dynamic authCred);

  Future<void> signOut();

  Future<String?> updateName(String name);

  Future<bool> uploadProfileImage(File profileImage);
}
