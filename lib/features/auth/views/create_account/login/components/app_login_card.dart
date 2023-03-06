import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../../core_packages.dart';
import '../../../../../../utils/components/buttons/custom_filled_button.dart';
import '../../../../../../utils/components/fields/custom_email_field.dart';
import '../../../../../../utils/components/fields/custom_password_field.dart';
import '../../../../../../utils/core/text_validator.dart';
import '../login_controller.dart';

class AppLoginCard extends HookWidget {
  final LoginController controller;
  AppLoginCard({super.key, required this.controller});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final autoValidateMode = useState(AutovalidateMode.disabled);

    void onSubmitted() {
      if (_formKey.currentState?.validate() ?? false) {
        controller.login(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
      } else {
        autoValidateMode.value = AutovalidateMode.onUserInteraction;
      }
    }

    return Column(
      children: [
        Row(children: const [
          Expanded(child: Divider()),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Paddings.sm),
            child: Text(
              "Already have an account",
              style: TextStyle(
                color: AppColors.darkGray,
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Expanded(child: Divider()),
        ]),
        const SizedBox(height: Paddings.md),
        Form(
          key: _formKey,
          autovalidateMode: autoValidateMode.value,
          child: Column(
            children: [
              CustomEmailField(
                labelText: AppStrings.email,
                controller: emailController,
              ),
              const SizedBox(height: Paddings.sm),
              CustomPasswordField(
                labelText: AppStrings.password,
                controller: passwordController,
                validator: TextValidator.optionalPasswordValidator,
                textInputAction: TextInputAction.done,
                onSubmitted: (_) => onSubmitted(),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () => context.goNamed(RouteNames.resetPassword),
              child: const CustomText(AppStrings.forgPass),
            ),
          ],
        ),
        const SizedBox(height: Paddings.sm),
        CustomFilledButton(
          onPressed: onSubmitted,
          child: const Text(AppStrings.login),
        ),
        const SizedBox(height: Paddings.md),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomText(AppStrings.loginNotMember),
            TextButton(
              onPressed: () => context.goNamed(RouteNames.signup),
              child: const CustomText(AppStrings.signup),
            ),
          ],
        ),
      ],
    );
  }
}
