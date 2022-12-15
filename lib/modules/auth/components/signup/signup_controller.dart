import 'dart:async';
import 'package:colartive2/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/controllers/i_form_controller.dart';
import '../../../components/popups/custom_snackbar.dart';
import '../../auth_controller.dart';

class SignupController extends IFormController<AuthController> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;

  final RxBool _isConfirmObscure = true.obs;
  bool get isConfirmObscure => _isConfirmObscure.value;

  final RxBool _isAgreePolicy = false.obs;
  bool get isAgreePolicy => _isAgreePolicy.value;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    super.onClose();
  }

  void toggleConfirmObscure() {
    _isConfirmObscure.value = !_isConfirmObscure.value;
  }

  void toggleAgreePolicy(bool? value) {
    if (value != null) _isAgreePolicy.value = value;
  }

  @override
  Future<void> submitForm() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (isAgreePolicy) {
      isLoading = true;
      final status = await provider.signup(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        body: {
          'firstName': firstNameController.text.trim(),
          'lastName': lastNameController.text.trim(),
        },
      );
      isLoading = false;
      if (status != null) {
        Get.offAllNamed(RouteNames.navigationView);
      }
    } else {
      showCustomSnackBar(
        "Please, agree to the privacy policy.",
        isError: true,
      );
    }
  }
}
