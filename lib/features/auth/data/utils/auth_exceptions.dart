import 'package:colartive2/utils/core/app_strings.dart';

class AuthException implements Exception {
  final String code;
  final String message;

  AuthException({required this.code, required this.message});
}

class ServerException extends AuthException {
  ServerException({required super.code, String? message})
      : super(message: message ?? AppStrings.serverError);
}

class CredentialException extends AuthException {
  CredentialException({required super.code})
      : super(message: AppStrings.invalidEmailPass);
}

class EmailInUseException extends AuthException {
  EmailInUseException({required super.code})
      : super(message: AppStrings.emailAlreadyInUse);
}

class PasswordException extends AuthException {
  PasswordException({required super.code})
      : super(message: AppStrings.wrongPassword);
}

class AccountLockedException extends AuthException {
  AccountLockedException({required super.code})
      : super(message: AppStrings.accLocked);
}

class AccountNotVerifiedException extends AuthException {
  AccountNotVerifiedException({required super.code})
      : super(message: AppStrings.accNotVer);
}

class NoUserFoundException extends AuthException {
  NoUserFoundException({required super.code})
      : super(message: AppStrings.noUserFound);
}
