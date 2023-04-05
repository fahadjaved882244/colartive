import 'package:fpdart/fpdart.dart';

import '../../../utils/core/app_sizes.dart';
import '../../../utils/error/app_error.dart';
import '../model/auth_user.dart';
import 'i_auth_repository.dart';

class MockAuthRepository implements IAuthRepository {
  @override
  Option<AuthUser> get currentUser => const Option.none();

  @override
  TaskEither<AppError, bool> checkArtistClaim() {
    throw UnimplementedError();
  }

  @override
  TaskEither<AppError, Unit> changePassword(
      {required String oldPassword, required String newPassword}) {
    throw UnimplementedError();
  }

  @override
  TaskEither<AppError, AuthUser> externalSignIn(authCred) {
    return TaskEither.leftTask(Task(() async {
      await Future.delayed(AppTimes.xs);
      return const AppError.accountLocked(code: '24');
    }));
  }

  @override
  TaskEither<AppError, Unit> resetPassword(String email) {
    return TaskEither.leftTask(Task(() async {
      await Future.delayed(AppTimes.xs);
      return const AppError.accountLocked(code: '24');
    }));
  }

  @override
  TaskEither<AppError, AuthUser> login(
      {required String email, required String password}) {
    return TaskEither.leftTask(Task(() async {
      await Future.delayed(AppTimes.xs);
      return const AppError.accountLocked(code: '24');
    }));
  }

  @override
  TaskEither<AppError, Unit> signOut() {
    throw UnimplementedError();
  }

  @override
  TaskEither<AppError, AuthUser> signup({
    required String email,
    required String password,
  }) {
    return TaskEither.leftTask(Task(() async {
      await Future.delayed(AppTimes.sl);
      return const AppError.emailAlreadyInUse(code: "320");
    }));
  }

  @override
  TaskEither<AppError, Unit> updateEmail(
      {required String newEmail, required String password}) {
    throw UnimplementedError();
  }

  @override
  TaskEither<AppError, Unit> verifyEmail([Object? actionCodeSettings]) {
    throw UnimplementedError();
  }

  @override
  Stream<Option<AuthUser>> get authStateChange async* {
    await Future.delayed(AppTimes.xs);
    // yield AuthUser(
    //   id: 'qeqweqweqweqwe',
    //   email: 'fahad@gmail.com',
    //   name: 'Muhammad fahad Javed',
    //   isVerified: false,
    // );
    // throw UnimplementedError();
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
}
