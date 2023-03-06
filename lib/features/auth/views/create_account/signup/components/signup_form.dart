import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../../../core_packages.dart';
import '../../../../../../utils/components/buttons/custom_filled_button.dart';
import '../../../../../../utils/components/fields/custom_email_field.dart';
import '../../../../../../utils/components/fields/custom_password_field.dart';
import '../../../../../../utils/components/fields/custom_text_form_field.dart';
import '../../../../../../utils/core/text_validator.dart';
import '../../../../data/utils/auth_error_handler.dart';
import '../signup_controller.dart';

class SignupForm extends HookConsumerWidget {
  final GlobalKey<FormState> formKey;
  final ValueNotifier<AutovalidateMode> autovalidateMode;
  const SignupForm({
    super.key,
    required this.formKey,
    required this.autovalidateMode,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(signupControllerProvider);

    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();

    ref.listen<AsyncValue>(
      signupControllerProvider,
      (prev, next) {
        if (!next.isRefreshing && next.hasError) {
          AuthErrorHandler.handleError(context, next.error!);
        } else if (!next.isRefreshing && next.hasValue) {
          context.goNamed(RouteNames.settings);
        }
      },
    );

    void onSubmitted() {
      if (formKey.currentState?.validate() ?? false) {
        ref.read(signupControllerProvider.notifier).signup(
              email: emailController.text.trim(),
              password: passwordController.text.trim(),
              name: nameController.text.trim(),
            );
      } else {
        autovalidateMode.value = AutovalidateMode.onUserInteraction;
      }
    }

    const spacer = SizedBox(height: Paddings.md);
    return Column(
      children: [
        CustomTextFormField(
          labelText: AppStrings.name,
          controller: nameController,
          prefixIcon: const Icon(Ionicons.person_outline),
          keyboardType: TextInputType.name,
          validator: TextValidator.nameValidator,
        ),
        spacer,
        CustomEmailField(
          labelText: AppStrings.email,
          controller: emailController,
        ),
        const SizedBox(height: Paddings.sm),
        CustomPasswordField(
          labelText: AppStrings.password,
          controller: passwordController,
          validator: TextValidator.passwordValidator,
        ),
        const SizedBox(height: Paddings.sm),
        CustomPasswordField(
          labelText: AppStrings.confirmPass,
          controller: confirmPasswordController,
          validator: (a) {
            if (passwordController.text == a) {
              return null;
            }
            return AppStrings.passDontMatch;
          },
        ),
        spacer,
        CustomFilledButton(
          onPressed: !state.isLoading ? onSubmitted : null,
          text: AppStrings.signup,
        ),
        const SizedBox(height: Paddings.md),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Already have an account"),
            TextButton(
              onPressed: () => context.goNamed(RouteNames.login),
              child: const CustomText(AppStrings.login),
            ),
          ],
        ),
      ],
    );
  }
}
