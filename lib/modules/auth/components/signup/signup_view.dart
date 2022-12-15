import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../services/auth/auth_validator.dart';
import '../../../../themes/app_sizes.dart';
import '../../../components/popups/custom_snackbar.dart';
import '../../../components/scaffolds/form_scaffold.dart';
import '../../../components/widgets/custom_text_form_field.dart';
import '../../../components/widgets/obscure_icon.dart';
import 'signup_controller.dart';

class SignupView extends StatelessWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const spacer = SizedBox(height: AppSizes.mediumPadding);
    return FormScaffold<SignupController>(
      title: 'Create a new account',
      isUpdateForm: false,
      builder: (controller) {
        return [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.lock_outline),
            title: Column(
              children: [
                CustomTextFormField(
                  labelText: "Email",
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: AuthValidator.emailValidator,
                ),
                const SizedBox(height: AppSizes.smallPadding),
                Obx(
                  () => CustomTextFormField(
                    labelText: "Password",
                    maxLines: 1,
                    controller: controller.passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: controller.isObscure,
                    validator: AuthValidator.passwordValidator,
                    suffixIcon: ObscureIcon(
                      isObscure: controller.isObscure,
                      onTap: controller.toggleObscure,
                    ),
                  ),
                ),
                const SizedBox(height: AppSizes.smallPadding),
                Obx(
                  () => CustomTextFormField(
                    labelText: 'Confirm password',
                    maxLines: 1,
                    controller: controller.confirmPasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: controller.isConfirmObscure,
                    validator: (a) {
                      if (controller.passwordController.text == a) {
                        return null;
                      }
                      return "Passwords don't match";
                    },
                    suffixIcon: ObscureIcon(
                      isObscure: controller.isConfirmObscure,
                      onTap: controller.toggleConfirmObscure,
                    ),
                  ),
                ),
              ],
            ),
          ),
          spacer,
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.person_outline),
            title: Column(
              children: [
                CustomTextFormField(
                  labelText: "First name",
                  controller: controller.firstNameController,
                  keyboardType: TextInputType.name,
                  validator: AuthValidator.nameValidator,
                ),
                const SizedBox(height: AppSizes.smallPadding),
                CustomTextFormField(
                  labelText: "Last name",
                  controller: controller.lastNameController,
                  keyboardType: TextInputType.name,
                  validator: AuthValidator.nameValidator,
                ),
              ],
            ),
          ),
          spacer,
          Obx(() {
            return CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              value: controller.isAgreePolicy,
              onChanged: controller.toggleAgreePolicy,
              title: RichText(
                text: TextSpan(
                  text: "I have read and agree to the ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Terms of Use',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // navigate to desired screen
                        },
                    ),
                    const TextSpan(text: ' and '),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          final url = Uri.parse(
                            "https://halalfinder.co.uk/privacy-policy/",
                          );
                          try {
                            await launchUrl(
                              url,
                              mode: LaunchMode.externalApplication,
                              webOnlyWindowName: "Privacy Policy",
                            );
                          } catch (e) {
                            showCustomSnackBar(
                              "Unable to open the Url",
                              isError: true,
                            );
                          }
                        },
                    ),
                    const TextSpan(text: '.'),
                  ],
                ),
              ),
            );
          }),
          const SizedBox(height: AppSizes.smallPadding),
        ];
      },
    );
  }
}
