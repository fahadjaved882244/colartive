import 'dart:async';
import 'dart:io';

import 'package:colartive2/features/profile/model/app_user.dart';
import 'package:colartive2/utils/error/app_error.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../service/auth_service.dart';

final authStateProvider = StreamProvider<bool>((ref) async* {
  yield* ref.watch(authServiceProvider).authState;
});

final authControllerProvider =
    StateNotifierProvider<AuthController, Option<AppUser>>((ref) {
  final authService = ref.watch(authServiceProvider);
  return AuthController(authService);
});

class AuthController extends StateNotifier<Option<AppUser>> {
  final AuthService authService;

  AuthController(this.authService) : super(const Option.none());

  TaskEither<AppError, Unit> signup({
    required String email,
    required String password,
    required String name,
  }) {
    return authService
        .signup(email: email, password: password, name: name)
        .map((user) {
      state = user.toOption();
      return unit;
    });
  }

  TaskEither<AppError, Unit> login({
    required String email,
    required String password,
  }) {
    return authService.login(email: email, password: password).map(
      (user) {
        state = user.toOption();
        return unit;
      },
    );
  }

  TaskEither<AppError, Unit> signInWithGoogle() {
    return authService.googleSignIn().map((user) {
      state = user.toOption();
      return unit;
    });
  }

  TaskEither<AppError, Unit> resetPassword(String email) {
    return authService.resetPassword(email);
  }

  TaskEither<AppError, Unit> updateEmail({
    required String newEmail,
    required String password,
  }) {
    return TaskEither.fromOption(
      state,
      () => const AppError.unExpectedAuth(),
    ).flatMap(
      (user) => authService
          .updateEmail(uid: user.id, newEmail: newEmail, password: password)
          .map((r) {
        state = state.map((t) => t.copyWith(email: newEmail));
        return unit;
      }),
    );
  }

  TaskEither<AppError, Unit> changePassword({
    required String oldPassword,
    required String newPassword,
  }) {
    return authService.changePassword(
      oldPassword: oldPassword,
      newPassword: newPassword,
    );
  }

  TaskEither<AppError, Unit> signOut() {
    return authService.signOut().map((r) {
      state = const Option.none();
      return unit;
    });
  }

  TaskEither<AppError, Unit> updateUserDetails({
    required String name,
    required String bio,
  }) {
    return TaskEither.fromOption(
      state,
      () => const AppError.unExpectedAuth(),
    ).flatMap(
      (user) => authService
          .updateUserDetails(uid: user.id, name: name, bio: bio)
          .map((r) {
        state = state.map((t) => t.copyWith(name: name, bio: bio));
        return unit;
      }),
    );
  }

  Future<bool> uploadProfileImage(File profileImage) {
    // TODO: implement uploadProfileImage
    throw UnimplementedError();
  }

  TaskEither<AppError, Unit> verifyEmail([Object? actionCodeSettings]) {
    return authService.verifyEmail(actionCodeSettings);
  }

  Future<void> verifyPhone(
      {required String phoneNumber,
      required void Function(dynamic authCred) verificationCompleted,
      required void Function(Exception p1) verificationFailed,
      required void Function(String p1, int? p2) codeSent,
      required void Function(String p1) codeAutoRetrievalTimeout}) {
    return authService.verifyPhone(
      phoneNumber: phoneNumber,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  Future<void> facebookSignIn() async {
    // state = const AsyncLoading();

    // final LoginResult result =
    //     await FacebookAuth.instance.login(loginBehavior: LoginBehavior.webOnly);
    // if (result.status == LoginStatus.success) {
    //   final accessToken = result.accessToken!;
    //   final authCred = FacebookAuthProvider.credential(accessToken.token);

    //   state = await AsyncValue.guard(
    //     () => _authRepo.externalSignIn(authCred),
    //   );
    // }
    // state = const AsyncData(null);
  }

  Future<void> appleSignIn() async {
    // if (!await SignInWithApple.isAvailable()) {
    //   return AuthStatus.notSupported;
    // }
    // try {
    //   final credential = await SignInWithApple.getAppleIDCredential(
    //     scopes: [
    //       AppleIDAuthorizationScopes.email,
    //       AppleIDAuthorizationScopes.fullName,
    //     ],
    //   );

    //   final accessToken = credential.authorizationCode;
    //   final payload = {
    //     'loginProvider': 'Apple',
    //     'providerKey': accessToken,
    //     'name': credential.givenName,
    //     'email': credential.email,
    //     'photoUrl': null,
    //   };
    //   // print(payload);
    //   final map = await _provider.externalSignIn(payload);
    //   final status = await _proccessLogin(map);
    //   return status;
    // } on SignInWithAppleException {
    //   return AuthStatus.cancelledByUser;
    // }
  }
}
