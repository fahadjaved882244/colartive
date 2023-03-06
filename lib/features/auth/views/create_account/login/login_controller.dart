import '../../../../../core_packages.dart';
import '../../../data/repositories/i_auth_repository.dart';
import '../../auth_controller.dart';

final loginControllerProvider =
    StateNotifierProvider.autoDispose<LoginController, AsyncValue<void>>((ref) {
  final authRepo = ref.watch(authRepoProvider);
  return LoginController(authRepo);
});

class LoginController extends StateNotifier<AsyncValue<void>> {
  final IAuthRepository _authRepo;
  LoginController(this._authRepo) : super(const AsyncData(null));

  Future<void> login({required String email, required String password}) async {
    FocusManager.instance.primaryFocus?.unfocus();

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _authRepo.login(email: email, password: password),
    );
  }

  Future<void> googleSignIn() async {
    // state = const AsyncLoading();

    // final googleUser = await _googleSignIn.signIn();
    // if (googleUser != null) {
    //   final googleAuthentication = await googleUser.authentication;
    //   final authCred = OAuthCredential(
    //     providerId: 'google.com',
    //     signInMethod: 'google.com',
    //     idToken: googleAuthentication.idToken,
    //     accessToken: googleAuthentication.accessToken,
    //   );
    // state = await AsyncValue.guard(
    //   () => _authRepo.externalSignIn(authCred),
    // );
    // }
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
