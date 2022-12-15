class AuthException implements Exception {
  final String code;
  final String message;

  AuthException({required this.code, required this.message});
}

class ServerException extends AuthException {
  ServerException({required String code, String? message})
      : super(
            code: code,
            message: message ?? 'Server Error! or No internet connection!');
}

class CredentialException extends AuthException {
  CredentialException({required String code})
      : super(code: code, message: 'Invalid email or password!');
}

class EmailException extends AuthException {
  EmailException({required String code})
      : super(
            code: code,
            message:
                'Email already in use! If you have an account on Halal Finder client app login with your email.');
}

class PasswordException extends AuthException {
  PasswordException({required String code})
      : super(code: code, message: 'Wrong password!');
}

class AccountLockedException extends AuthException {
  AccountLockedException({required String code})
      : super(code: code, message: 'Account is locked!');
}

class AccountNotVerifiedException extends AuthException {
  AccountNotVerifiedException({required String code})
      : super(code: code, message: 'Account not verified!');
}

class NoUserFoundException extends AuthException {
  NoUserFoundException({required String code})
      : super(
            code: code, message: 'No user corresponding to the email address!');
}
