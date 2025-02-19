import 'package:colartive2/utils/components/widgets/custom_text.dart';
import 'package:colartive2/utils/core/app_colors.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:colartive2/routes/app_paths.dart';
import 'package:colartive2/utils/core/app_sizes.dart';
import 'package:colartive2/utils/core/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../../../utils/components/fields/custom_email_field.dart';
import '../../../../../../utils/components/fields/custom_password_field.dart';
import '../../../../../../utils/core/text_validator.dart';
import '../../../../data/utils/auth_error_handler.dart';
import '../login_controller.dart';

class LoginFormCard extends HookConsumerWidget {
  LoginFormCard({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginControllerProvider);

    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final autoValidateMode = useState(AutovalidateMode.disabled);

    ref.listen<AsyncValue>(
      loginControllerProvider,
      (prev, next) {
        if (!next.isRefreshing && next.hasError) {
          AuthErrorHandler.handleError(context, next.error!);
        } else if (!next.isRefreshing && next.hasValue) {
          context.go(AppPaths.settings);
        }
      },
    );

    void onSubmitted() {
      if (_formKey.currentState?.validate() ?? false) {
        ref.read(loginControllerProvider.notifier).login(
              email: emailController.text.trim(),
              password: passwordController.text.trim(),
            );
      } else {
        autoValidateMode.value = AutovalidateMode.onUserInteraction;
      }
    }

    return Column(
      children: [
        const Row(children: [
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
              onPressed: () => context.go(AppPaths.resetPassword),
              child: const CustomText(AppStrings.forgPass),
            ),
          ],
        ),
        const SizedBox(height: Paddings.xs),
        FilledButton(
          onPressed: !state.isLoading ? onSubmitted : null,
          child: state.isLoading
              ? const CircularProgressIndicator()
              : const Text(AppStrings.login),
        ),
        const SizedBox(height: Paddings.xs),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomText(AppStrings.loginNotMember),
            TextButton(
              onPressed: () => context.go(AppPaths.signup),
              child: const CustomText(AppStrings.signup),
            ),
          ],
        ),
      ],
    );
  }
}
