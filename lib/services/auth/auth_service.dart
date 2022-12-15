import 'dart:async';

import '../../data/models/user.dart';
import '../../modules/components/popups/custom_snackbar.dart';
import 'auth_exceptions.dart';

class AuthService {
  FutureOr<UserModel?> handleError(Object error) {
    if (error is ServerException) {
      showCustomSnackBar(error.message, isError: true);
    } else if (error is CredentialException) {
      showCustomSnackBar(error.message, isError: true);
    } else if (error is EmailException) {
      showCustomSnackBar(error.message, isError: true);
    } else if (error is PasswordException) {
      showCustomSnackBar(error.message, isError: true);
    } else if (error is AccountLockedException) {
      showCustomSnackBar(error.message, isError: true);
    } else if (error is AccountNotVerifiedException) {
      showCustomSnackBar(error.message, isError: true);
    } else if (error is AccountNotVerifiedException) {
      showCustomSnackBar(error.message, isError: true);
    } else if (error is NoUserFoundException) {
      showCustomSnackBar(error.message, isError: true);
    }
    return null;
  }
}
