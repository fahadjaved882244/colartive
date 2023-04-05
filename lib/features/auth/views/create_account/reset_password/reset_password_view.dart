import 'package:colartive2/extensions/base_state_x.dart';
import 'package:colartive2/features/auth/views/create_account/reset_password/reset_password_controller.dart';
import 'package:colartive2/utils/state/base_state.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../../core_packages.dart';
import '../../../../../utils/components/buttons/custom_filled_button.dart';
import '../../../../../utils/components/fields/custom_email_field.dart';
import '../../../../../utils/components/scaffolds/form_scaffold.dart';

class ResetPasswordView extends HookConsumerWidget {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(resetPasswordControllerProvider);

    final formKey = useMemoized(GlobalKey<FormState>.new, const []);
    final autovalidateMode = useState(AutovalidateMode.disabled);

    final emailController = useTextEditingController();

    ref.listen<BaseState>(
      resetPasswordControllerProvider,
      (_, next) {
        next.showErrorOrSuccOrNav(
          context,
          success: AppStrings.forgPassEmailSent,
          routeName: RouteNames.settings,
        );
      },
    );

    void onSubmitted() {
      if (formKey.currentState?.validate() ?? false) {
        ref
            .read(resetPasswordControllerProvider.notifier)
            .resetPassword(email: emailController.text.trim());
      } else {
        autovalidateMode.value = AutovalidateMode.onUserInteraction;
      }
    }

    return FormScaffold(
      formKey: formKey,
      autovalidateMode: autovalidateMode.value,
      title: AppStrings.resetPass,
      isLoading: state.isLoading,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(
              vertical: Paddings.sm, horizontal: Paddings.md),
          child: CustomText(
            AppStrings.forgPassDes,
            textAlign: TextAlign.center,
          ),
        ),
        CustomEmailField(
          labelText: AppStrings.email,
          controller: emailController,
          textInputAction: TextInputAction.done,
          onSubmitted: (_) => onSubmitted(),
        ),
        const SizedBox(height: Paddings.md),
        CustomFilledButton(
          onPressed: !state.isLoading ? () => onSubmitted() : null,
          text: AppStrings.submit,
        ),
        const SizedBox(height: Paddings.md),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomText(AppStrings.loginTitle),
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
