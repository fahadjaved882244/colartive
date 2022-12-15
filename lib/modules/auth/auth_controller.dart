import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../data/models/user.dart';
import '../../services/auth/auth_service.dart';
import '../../services/auth/i_auth_provider.dart';
import '../components/popups/custom_snackbar.dart';

class AuthController extends GetxService with AuthService {
  final IAuthProvider _authProvider;
  AuthController(this._authProvider);
  // final GoogleSignIn _googleSignIn = GoogleSignIn();

  final Rxn<UserModel?> _userModel = Rxn();
  UserModel? get user => _userModel.value;

  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool value) => _isLoading.value = value;

  String verificationCode = "";

  Future<UserModel?> getUser() async {
    final user = await _authProvider.getUser();
    _userModel.value = user;
    return user;
  }

  Future<void> verifyPhone(String phoneNumber, Function setTimer) async {
    isLoading = true;

    await _authProvider.verifyPhone(
      phoneNumber: phoneNumber,
      verificationCompleted: (AuthCredential authCredential) async {},
      verificationFailed: (FirebaseAuthException authException) {
        Get.back(closeOverlays: false);
        showCustomSnackBar("Sending verification code failed");
      },
      codeSent: (String verificationId, int? forceResendingToken) {
        setTimer();
        verificationCode = verificationId;
        isLoading = false;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        verificationCode = verificationId;
        isLoading = false;
      },
    );
  }

  Future<bool> addPhoneNumber(String phoneNumber) async {
    return _authProvider.addPhoneNumber(phoneNumber).then(
      (value) => true,
      onError: (error) async {
        handleError(error);
        return false;
      },
    );
  }

  Future<UserModel?> signup({
    required String email,
    required String password,
    required Map<String, dynamic> body,
  }) async {
    final user = await _authProvider
        .signup(
          email: email,
          password: password,
          body: body,
        )
        .catchError(handleError);
    _userModel.value = user;
    return user;
  }

  Future<UserModel?> login({
    required String email,
    required String password,
  }) async {
    final user = await _authProvider
        .login(email: email, password: password)
        .catchError(handleError);
    _userModel.value = user;
    return user;
  }

  Future<bool> updateUserName({
    required String firstName,
    required String lastName,
  }) async {
    final status = await _authProvider
        .updateUser(user!.id, {"firstName": firstName, 'lastName': lastName});
    if (status) {
      _userModel.value =
          _userModel.value!.copyWith(firstName: firstName, lastName: lastName);
    }
    return status;
  }

  Future<bool> updateEmail({
    required String newEmail,
    required String password,
  }) async {
    return _authProvider.updateEmail(newEmail, password).then(
      (value) => true,
      onError: (error) async {
        handleError(error);
        return false;
      },
    );
  }

  Future<bool> verifyEmail() {
    return _authProvider.verifyEmail();
  }

  Future<bool> changePassword(String oldPassword, String newPassword) async {
    return _authProvider.changePassword(oldPassword, newPassword).then(
      (value) => true,
      onError: (error) async {
        handleError(error);
        return false;
      },
    );
  }

  Future<bool> forgotPassword(String email) async {
    return _authProvider.forgotPassword(email).then(
      (value) => true,
      onError: (error) async {
        handleError(error);
        return false;
      },
    );
  }

  Future<String?> getToken(String uid) async {
    return _authProvider.getToken(uid);
  }

  Future<void> uploadProfileImage() async {
    // if (result != null) {
    //     picLoading = true;
    //     update(['UPDATE_IMAGE']);

    //     final File profileImage =
    //         result.paths.map((path) => File(path!)).toList()[0];
    // final isUploaded = await _provider.uploadProfileImage(
    //   user!.id,
    //   profileImage,
    //   user!.photoUrl != null ? user!.photoUrl!.split('/').last : null,
    // );
    // if (isUploaded) {
    //   final name = profileImage.path.split('/').last;
    //   user = user!.copyWith(
    //       photoUrl:
    //           'https://rightmove.pk/Repository/CustomerImages/${user!.id}/$name');
    // picLoading = false;

    // update(['UPDATE_IMAGE']);
    // }
    // }
  }

  Future<UserModel?> googleSignIn() async {
    // final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    // UserModel? _user;
    // if (googleUser != null) {
    //   final googleAuthentication = await googleUser.authentication;
    //   final authCred = OAuthCredential(
    //     providerId: 'google.com',
    //     signInMethod: 'google.com',
    //     idToken: googleAuthentication.idToken,
    //     accessToken: googleAuthentication.accessToken,
    //   );
    //   _user =
    //       await _authProvider.externalSignIn(authCred).catchError(handleError);
    //   _userModel.value = _user;
    // } else {
    //   showCustomSnackBar(message: 'Cancelled by user', isError: true);
    // }
    // return _user;
    return null;
  }

  Future<UserModel?> facebookSignIn() async {
    // UserModel? _user;
    // final LoginResult result =
    //     await FacebookAuth.instance.login(loginBehavior: LoginBehavior.webOnly);
    // if (result.status == LoginStatus.success) {
    //   final accessToken = result.accessToken!;
    //   // final userData = await FacebookAuth.instance.getUserData();
    //   final authCred = FacebookAuthProvider.credential(accessToken.token);
    //   _user =
    //       await _authProvider.externalSignIn(authCred).catchError(handleError);
    //   _userModel.value = _user;
    // } else {
    //   showCustomSnackBar(message: 'Cancelled by user', isError: true);
    // }
    // return _user;
    return null;
  }

  Future<UserModel?> appleSignIn() async {
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
    //   // print(map);
    //   final status = await _proccessLogin(map);
    //   return status;
    // } on SignInWithAppleException {
    //   return AuthStatus.cancelledByUser;
    // }
    return null;
  }

  Future<void> logout() async {
    _userModel.value = null;
    await _authProvider.signOut();
    // if (await _googleSignIn.isSignedIn()) {
    //   await _googleSignIn.disconnect();
    // }
    // if (await FacebookAuth.instance.accessToken != null) {
    //   await FacebookAuth.instance.logOut();
    // }
  }
}
