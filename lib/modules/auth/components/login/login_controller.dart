import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../data/models/user.dart';
import '../../../../routes/route_names.dart';
import '../../../components/controllers/i_form_controller.dart';
import '../../auth_controller.dart';

class LoginController extends IFormController<AuthController> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  final RxBool _rememberMe = false.obs;
  bool get rememberMe => _rememberMe.value;
  set rememberMe(value) => _rememberMe(value);

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  @override
  Future<void> submitForm() async {
    FocusManager.instance.primaryFocus?.unfocus();
    isLoading = true;
    final status = await provider.login(
      email: emailController.text,
      password: passwordController.text,
    );
    isLoading = false;
    _proccessStatus(status);
  }

  Future<void> googleLoginPressed() async {
    FocusManager.instance.primaryFocus?.unfocus();
    isLoading = true;
    final status = await provider.googleSignIn();
    isLoading = false;
    _proccessStatus(status);
  }

  Future<void> facebookLoginPressed() async {
    FocusManager.instance.primaryFocus?.unfocus();
    isLoading = true;
    final status = await provider.facebookSignIn();
    isLoading = false;
    _proccessStatus(status);
  }

  Future<void> appleLoginPressed() async {
    FocusManager.instance.primaryFocus?.unfocus();
    isLoading = true;
    final status = await provider.appleSignIn();
    isLoading = false;
    _proccessStatus(status);
  }

  void _proccessStatus(UserModel? user) {
    if (user != null) {
      Get.offAllNamed(RouteNames.navigationView);
    }
  }
}
