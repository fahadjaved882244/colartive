import 'package:colartive2/utils/core/app_strings.dart';

class AuthException implements Exception {
  final String code;
  final String message;

  AuthException({required this.code, required this.message});
}

class ServerException extends AuthException {
  ServerException({required String code, String? message})
      : super(code: code, message: message ?? AppStrings.serverError);
}

class CredentialException extends AuthException {
  CredentialException({required String code})
      : super(code: code, message: AppStrings.invalidEmailPass);
}

class EmailInUseException extends AuthException {
  EmailInUseException({required String code})
      : super(code: code, message: AppStrings.emailAlreadyInUse);
}

class PasswordException extends AuthException {
  PasswordException({required String code})
      : super(code: code, message: AppStrings.wrongPassword);
}

class AccountLockedException extends AuthException {
  AccountLockedException({required String code})
      : super(code: code, message: AppStrings.accLocked);
}

class AccountNotVerifiedException extends AuthException {
  AccountNotVerifiedException({required String code})
      : super(code: code, message: AppStrings.accNotVer);
}

class NoUserFoundException extends AuthException {
  NoUserFoundException({required String code})
      : super(code: code, message: AppStrings.noUserFound);
}
