import 'package:colartive2/extensions/async_value.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../core_packages.dart';

import '../../../../../utils/components/buttons/custom_filled_button.dart';
import '../../../../../utils/components/fields/custom_email_field.dart';
import '../../../../../utils/components/fields/custom_password_field.dart';
import '../../../../../utils/components/scaffolds/form_scaffold.dart';
import '../../../../../utils/core/text_validator.dart';
import 'update_email_controller.dart';

class UpdateEmailView extends HookConsumerWidget {
  const UpdateEmailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(updateEmailControllerProvider);

    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    ref.listen<AsyncValue<void>>(
      updateEmailControllerProvider,
      (_, next) {
        next.showErrorOrSuccess(context, successMsg: AppStrings.emailUpdated);
      },
    );

    void onSubmitted(GlobalKey<FormState> formKey,
        ValueNotifier<AutovalidateMode> autovalidateMode) {
      if (formKey.currentState?.validate() ?? false) {
        ref.read(updateEmailControllerProvider.notifier).updateEmail(
              email: emailController.text.trim(),
              password: passwordController.text.trim(),
            );
      } else {
        autovalidateMode.value = AutovalidateMode.onUserInteraction;
      }
    }

    return FormScaffold(
      title: AppStrings.updateEmail,
      isLoading: state.isLoading,
      builder: (context, formKey, autovalidateMode) => [
        CustomEmailField(
          labelText: AppStrings.newEmail,
          controller: emailController,
        ),
        const SizedBox(height: Paddings.sm),
        CustomPasswordField(
          labelText: AppStrings.password,
          controller: passwordController,
          validator: TextValidator.optionalPasswordValidator,
          textInputAction: TextInputAction.done,
        ),
        const SizedBox(height: Paddings.md),
        CustomFilledButton(
          onPressed: !state.isLoading
              ? () => onSubmitted(formKey, autovalidateMode)
              : null,
          text: AppStrings.submit,
        ),
      ],
    );
  }
}
