import 'dart:async';

import 'package:colartive2/utils/providers/core_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core_packages.dart';
import '../../auth_controller.dart';

part 'login_controller.g.dart';

@riverpod
class LoginController extends _$LoginController {
  @override
  FutureOr<void> build() {}

  Future<void> login({required String email, required String password}) async {
    FocusManager.instance.primaryFocus?.unfocus();

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(authRepoProvider).login(email: email, password: password),
    );
  }

  Future<void> googleSignIn() async {
    state = const AsyncLoading();

    final googleUser = await ref.read(googleSignInProvider).signIn();
    if (googleUser != null) {
      final googleAuthentication = await googleUser.authentication;
      final authCred = OAuthCredential(
        providerId: 'google.com',
        signInMethod: 'google.com',
        idToken: googleAuthentication.idToken,
        accessToken: googleAuthentication.accessToken,
      );
      state = await AsyncValue.guard(
        () => ref.read(authRepoProvider).externalSignIn(authCred),
      );
    }
    state = const AsyncData(null);
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
