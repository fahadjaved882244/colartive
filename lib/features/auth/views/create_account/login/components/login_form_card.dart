import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../../core_packages.dart';
import '../../../../../../utils/components/buttons/custom_filled_button.dart';
import '../../../../../../utils/components/fields/custom_email_field.dart';
import '../../../../../../utils/components/fields/custom_password_field.dart';
import '../../../../../../utils/core/text_validator.dart';
import '../../../../data/utils/auth_error_handler.dart';
import '../login_controller_view.dart';

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
              onPressed: () => context.go(AppPaths.resetPassword),
              child: const CustomText(AppStrings.forgPass),
            ),
          ],
        ),
        const SizedBox(height: Paddings.xs),
        CustomFilledButton(
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
