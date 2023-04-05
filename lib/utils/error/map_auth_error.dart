import 'package:colartive2/utils/error/app_error.dart';
import 'package:colartive2/utils/logger/app_logger.dart';
import 'package:firebase_auth/firebase_auth.dart';

AppError mapAuthError(Object e, StackTrace stackTrace) {
  if (e is FirebaseAuthException) {
    AppLogger.e(e.message);
    if (e.code == "email-already-in-use" ||
        e.code == "account-exists-with-different-credential") {
      return AppError.emailAlreadyInUse(code: e.code);
    } else if (e.code == "invalid-email") {
      return AppError.invalidEmail(code: e.code);
    } else if (e.code == "operation-not-allowed") {
      return AppError.operNotAllowed(code: e.code);
    } else if (e.code == "weak-password") {
      return AppError.weakPassword(code: e.code);
    } else if (e.code == "user-disabled") {
      return AppError.accountLocked(code: e.code);
    } else if (e.code == "user-not-found" || e.code == "wrong-password") {
      return AppError.invalidCredential(code: e.code);
    } else if (e.code == "requires-recent-login") {
      return AppError.requireReAuth(code: e.code);
    } else if (e.code == "invalid-verification-code") {
      return AppError.invalidVerifCode(code: e.code);
    } else {
      return const AppError.unExpectedAuth();
    }
  } else {
    return const AppError.unExpectedAuth();
  }
}
