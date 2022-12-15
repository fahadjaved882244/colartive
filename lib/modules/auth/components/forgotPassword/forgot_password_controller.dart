import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../components/controllers/i_form_controller.dart';
import '../../../components/popups/custom_snackbar.dart';
import '../../auth_controller.dart';

class ForgotPasswordController extends IFormController<AuthController> {
  late final TextEditingController emailController;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }

  @override
  Future<void> submitForm() async {
    FocusManager.instance.primaryFocus?.unfocus();
    isLoading = true;
    final status = await auth.forgotPassword(emailController.text.trim());
    isLoading = false;
    if (status) {
      Get.back();
      showCustomSnackBar('Reset password email sent to your email address.');
    }
  }
}
