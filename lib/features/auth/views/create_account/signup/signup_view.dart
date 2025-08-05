import 'package:colartive2/routes/app_paths.dart';
import 'package:colartive2/utils/core/app_sizes.dart';
import 'package:colartive2/utils/core/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../../utils/components/fields/custom_email_field.dart';
import '../../../../../utils/components/fields/custom_password_field.dart';
import '../../../../../utils/components/fields/custom_text_form_field.dart';
import '../../../../../utils/components/scaffolds/form_scaffold.dart';
import '../../../../../utils/core/text_validator.dart';
import '../../../data/utils/auth_error_handler.dart';
import 'signup_controller.dart';

class SignupView extends HookConsumerWidget {
  const SignupView({super.key});

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
          context.go(AppPaths.settings);
        }
      },
    );

    const spacer = SizedBox(height: Paddings.md);
    return FormScaffold(
      title: AppStrings.signupTitle,
      isLoading: state.isLoading,
      isUpdateForm: false,
      onSubmitted: () {
        ref.read(signupControllerProvider.notifier).signup(
              email: emailController.text.trim(),
              password: passwordController.text.trim(),
              name: nameController.text.trim(),
            );
      },
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
      ],
    );
  }
}
