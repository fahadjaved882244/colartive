import 'dart:async';

import 'package:colartive2/features/auth/data/utils/auth_exceptions.dart';
import 'package:colartive2/utils/providers/core_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core_packages.dart';
import '../../auth_controller.dart';

part 'login_controller.g.dart';

@riverpod
class LoginController extends _$LoginController {
  @override
  AsyncValue build() {
    return const AsyncData(null);
  }

  Future<void> login({required String email, required String password}) async {
    FocusManager.instance.primaryFocus?.unfocus();

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(authRepoProvider).login(email: email, password: password),
    );
  }

  Future<void> googleSignIn() async {
    state = const AsyncLoading();

    // Signing In with Google
    final googleUserState =
        await AsyncValue.guard(() => ref.read(googleSignInProvider).signIn());

    // Check for success, exception and cancelled by User cases
    final result = await googleUserState.whenOrNull<Future<AsyncValue?>>(
      data: (googleUser) async {
        if (googleUser != null) {
          return _googleAuthenticate(googleUser);
        } else {
          return AsyncError(
            CancelledByUserException(code: '300'),
            StackTrace.empty,
          );
        }
      },
      error: (error, __) async {
        return AsyncError(
          ServerException(code: error.toString()),
          StackTrace.empty,
        );
      },
    );

    // Updating the state based on result
    if (result != null) state = result;
  }

  Future<AsyncValue?> _googleAuthenticate(
      GoogleSignInAccount googleUser) async {
    final googleAuthState =
        await AsyncValue.guard(() => googleUser.authentication);

    return googleAuthState.whenOrNull<Future<AsyncValue>>(
      data: (googleAuth) async {
        final authCred = OAuthCredential(
          providerId: 'google.com',
          signInMethod: 'google.com',
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );

        return await AsyncValue.guard(
          () => ref.read(authRepoProvider).externalSignIn(authCred),
        );
      },
      error: (error, _) async {
        return AsyncError(
          ServerException(code: error.toString()),
          StackTrace.empty,
        );
      },
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
