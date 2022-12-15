import 'package:colartive2/modules/components/scaffolds/base_scaffold.dart';
import 'package:colartive2/themes/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/route_names.dart';
import '../../../../services/auth/auth_validator.dart';
import '../../../../themes/app_theme.dart';
import '../../../components/buttons/custom_filled_button.dart';
import '../../../components/widgets/custom_text_form_field.dart';
import '../../../components/widgets/obscure_icon.dart';
import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final smallStyle = Theme.of(context)
        .textTheme
        .bodyText2!
        .copyWith(color: AppColors.darkGray);
    final exSmallStyle = smallStyle.copyWith(fontSize: 13);
    return Obx(() {
      return BaseScaffold(
        title: 'Login to Your Account',
        resizeToAvoidBottomInset: false,
        isCancel: true,
        isLoading: controller.isLoading,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                // Row(children: const [
                //   Expanded(child: Divider()),
                //   Padding(
                //     padding:
                //         EdgeInsets.symmetric(horizontal: AppSizes.smallPadding),
                //     child: Text(
                //       "Use Any Social Account",
                //       style: TextStyle(
                //         color: AppColors.darkGray,
                //         fontSize: 13,
                //         fontWeight: FontWeight.w400,
                //       ),
                //     ),
                //   ),
                //   Expanded(child: Divider()),
                // ]),
                // const SizedBox(height: AppSizes.mediumPadding),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     _loginWithButton(
                //       context: context,
                //       text: "Google",
                //       image: 'assets/icons/signin/google.png',
                //       onTap: () async {
                //         await controller.googleLoginPressed();
                //       },
                //     ),
                //     const SizedBox(width: AppSizes.exSmallPadding),
                //     _loginWithButton(
                //       context: context,
                //       text: "Facebook",
                //       image: 'assets/icons/signin/facebook.png',
                //       onTap: () async {
                //         await controller.facebookLoginPressed();
                //       },
                //     ),
                //     const SizedBox(width: AppSizes.exSmallPadding),
                //     _loginWithButton(
                //       context: context,
                //       text: "Apple",
                //       image: 'assets/icons/signin/apple.png',
                //       onTap: () async {
                //         await controller.appleLoginPressed();
                //       },
                //     ),
                //   ],
                // ),
                // const SizedBox(height: AppSizes.mediumPadding),
                // Row(children: const [
                //   Expanded(child: Divider()),
                //   Padding(
                //     padding:
                //         EdgeInsets.symmetric(horizontal: AppSizes.smallPadding),
                //     child: Text(
                //       "Already Have Account",
                //       style: TextStyle(
                //         color: AppColors.darkGray,
                //         fontSize: 13,
                //         fontWeight: FontWeight.w400,
                //       ),
                //     ),
                //   ),
                //   Expanded(child: Divider()),
                // ]),
                const SizedBox(height: AppSizes.mediumPadding),
                GetBuilder<LoginController>(
                    id: 'UPDATE_FORM',
                    builder: (controller) {
                      return Form(
                        key: controller.formKey,
                        autovalidateMode: controller.autoValidateMode,
                        child: Column(
                          children: [
                            CustomTextFormField(
                              labelText: "Email",
                              controller: controller.emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: AuthValidator.emailValidator,
                              prefixIcon: const Icon(Icons.email),
                            ),
                            const SizedBox(height: AppSizes.smallPadding),
                            Obx(
                              () => CustomTextFormField(
                                labelText: "Password",
                                maxLines: 1,
                                controller: controller.passwordController,
                                keyboardType: TextInputType.visiblePassword,
                                validator: AuthValidator.loginPasswordValidator,
                                textInputAction: TextInputAction.done,
                                onSubmitted: (_) async => await loginPressed(),
                                obscureText: controller.isObscure,
                                prefixIcon: const Icon(Icons.lock_outline),
                                suffixIcon: ObscureIcon(
                                  isObscure: controller.isObscure,
                                  onTap: controller.toggleObscure,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Obx(
                          () => Checkbox(
                            value: controller.rememberMe,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            onChanged: (value) => controller.rememberMe = value,
                          ),
                        ),
                        Text('Remeber Me', style: smallStyle),
                      ],
                    ),
                    TextButton(
                      onPressed: () =>
                          Get.toNamed(RouteNames.forgotPasswordView),
                      child: Text(
                        "Forgot Password?",
                        style: smallStyle,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSizes.mediumPadding),
                CustomFilledButton(
                  text: 'Login',
                  onPressed: () async => await loginPressed(),
                ),
                const SizedBox(height: AppSizes.exSmallPadding),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Not a member yet?"),
                    TextButton(
                      onPressed: () => Get.toNamed(RouteNames.signupView),
                      child: const Text("Sign Up"),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Terms & Conditions",
                    style: exSmallStyle,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Privacy Policy", style: exSmallStyle),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }

  Future<void> loginPressed() async {
    if (controller.formKey.currentState!.validate()) {
      await controller.submitForm();
    } else {
      controller.updateValidationMode();
    }
  }
}
