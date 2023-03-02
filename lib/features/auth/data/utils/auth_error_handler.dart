import 'dart:async';

import 'package:flutter/widgets.dart';

import '../../../../utils/components/popups/custom_snackbar.dart';
import 'auth_exceptions.dart';

class AuthErrorHandler {
  AuthErrorHandler._();

  static FutureOr<void> handleError(BuildContext context, Object error) {
    if (error is ServerException) {
      showCustomSnackBar(context, error.message);
    } else if (error is CredentialException) {
      showCustomSnackBar(context, error.message);
    } else if (error is EmailInUseException) {
      showCustomSnackBar(context, error.message);
    } else if (error is PasswordException) {
      showCustomSnackBar(context, error.message);
    } else if (error is AccountLockedException) {
      showCustomSnackBar(context, error.message);
    } else if (error is AccountNotVerifiedException) {
      showCustomSnackBar(context, error.message);
    } else if (error is AccountNotVerifiedException) {
      showCustomSnackBar(context, error.message);
    } else if (error is NoUserFoundException) {
      showCustomSnackBar(context, error.message);
    } else {
      showCustomSnackBar(context, error.toString());
    }
    return null;
  }
}
