import 'package:colartive2/extensions/async_value.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../../core_packages.dart';
import '../../../../../utils/components/buttons/custom_filled_button.dart';
import '../../../../../utils/components/fields/custom_email_field.dart';
import '../../../../../utils/components/scaffolds/form_scaffold.dart';
import 'reset_password_controller.dart';

class ResetPasswordView extends HookConsumerWidget {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(resetPasswordControllerProvider);

    final emailController = useTextEditingController();

    ref.listen<AsyncValue<void>>(
      resetPasswordControllerProvider,
      (_, next) {
        next.showErrorOrSuccess(context,
            successMsg: AppStrings.forgPassEmailSent);
      },
    );

    void onSubmitted(GlobalKey<FormState> formKey,
        ValueNotifier<AutovalidateMode> autovalidateMode) {
      if (formKey.currentState?.validate() ?? false) {
        ref
            .read(resetPasswordControllerProvider.notifier)
            .resetPassword(email: emailController.text.trim());
      } else {
        autovalidateMode.value = AutovalidateMode.onUserInteraction;
      }
    }

    return FormScaffold(
      title: AppStrings.resetPass,
      isUpdateForm: false,
      isLoading: state.isLoading,
      builder: (BuildContext context, GlobalKey<FormState> formKey,
          ValueNotifier<AutovalidateMode> validateMode) {
        return [
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
          ),
          const SizedBox(height: Paddings.md),
          CustomFilledButton(
            onPressed: !state.isLoading
                ? () => onSubmitted(formKey, validateMode)
                : null,
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
        ];
      },
    );
  }
}
