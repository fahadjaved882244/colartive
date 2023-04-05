import 'package:colartive2/extensions/base_state_x.dart';
import 'package:colartive2/utils/state/base_state.dart';
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

    final formKey = useMemoized(GlobalKey<FormState>.new, const []);
    final autovalidateMode = useState(AutovalidateMode.disabled);
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    ref.listen<BaseState>(
      updateEmailControllerProvider,
      (_, next) {
        next.showErrorOrSuccOrNav(
          context,
          routeName: RouteNames.updateProfile,
          success: AppStrings.emailUpdated,
        );
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
      formKey: formKey,
      autovalidateMode: autovalidateMode.value,
      title: AppStrings.updateEmail,
      isLoading: state.isLoading,
      children: [
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
