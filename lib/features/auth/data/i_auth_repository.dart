import 'package:colartive2/utils/error/app_error.dart';
import 'package:fpdart/fpdart.dart';

import '../model/auth_user.dart';

abstract class IAuthRepository {
  Option<AuthUser> get currentUser;

  Stream<Option<AuthUser>> get authStateChange;

  TaskEither<AppError, bool> checkArtistClaim();

  TaskEither<AppError, AuthUser> signup({
    required String email,
    required String password,
  });

  TaskEither<AppError, AuthUser> login({
    required String email,
    required String password,
  });

  TaskEither<AppError, AuthUser> externalSignIn(authCred);

  Future<void> verifyPhone({
    required String phoneNumber,
    required void Function(dynamic authCred) verificationCompleted,
    required void Function(Exception) verificationFailed,
    required void Function(String, int?) codeSent,
    required void Function(String) codeAutoRetrievalTimeout,
  });

  TaskEither<AppError, Unit> updateEmail({
    required String newEmail,
    required String password,
  });

  TaskEither<AppError, Unit> verifyEmail([Object? actionCodeSettings]);

  TaskEither<AppError, Unit> changePassword({
    required String oldPassword,
    required String newPassword,
  });

  TaskEither<AppError, Unit> resetPassword(String email);

  TaskEither<AppError, Unit> signOut();
}
