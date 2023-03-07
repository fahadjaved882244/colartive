import 'package:colartive2/extensions/async_value.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../core_packages.dart';

import '../../../../../utils/components/buttons/custom_filled_button.dart';
import '../../../../../utils/components/fields/custom_password_field.dart';
import '../../../../../utils/components/scaffolds/form_scaffold.dart';
import '../../../../../utils/core/text_validator.dart';
import 'change_password_controller.dart';

class ChangePasswordView extends HookConsumerWidget {
  const ChangePasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(changePasswordControllerProvider);

    final formKey = useMemoized(GlobalKey<FormState>.new, const []);
    final autovalidateMode = useState(AutovalidateMode.onUserInteraction);
    final oldController = useTextEditingController();
    final newController = useTextEditingController();
    final confirmController = useTextEditingController();

    ref.listen<AsyncValue<void>>(
      changePasswordControllerProvider,
      (_, next) {
        next.showErrorOrNavigate(context, routeName: RouteNames.settings);
      },
    );

    void onSubmitted(GlobalKey<FormState> formKey,
        ValueNotifier<AutovalidateMode> autovalidateMode) {
      if (formKey.currentState?.validate() ?? false) {
        ref.read(changePasswordControllerProvider.notifier).changePassword(
              old: oldController.text.trim(),
              next: newController.text.trim(),
            );
      } else {
        autovalidateMode.value = AutovalidateMode.onUserInteraction;
      }
    }

    return FormScaffold(
      formKey: formKey,
      autoValidateMode: autovalidateMode.value,
      title: AppStrings.changePass,
      isLoading: state.isLoading,
      children: [
        const CustomText(AppStrings.current),
        const SizedBox(height: Paddings.xs),
        CustomPasswordField(
          labelText: AppStrings.currentPass,
          controller: oldController,
          validator: TextValidator.optionalPasswordValidator,
          textInputAction: TextInputAction.next,
        ),
        const SizedBox(height: Paddings.md),
        const CustomText(AppStrings.neww),
        const SizedBox(height: Paddings.xs),
        CustomPasswordField(
          labelText: AppStrings.newPass,
          controller: newController,
          validator: TextValidator.passwordValidator,
          textInputAction: TextInputAction.next,
        ),
        const SizedBox(height: Paddings.sm),
        CustomPasswordField(
          labelText: AppStrings.confirmPass,
          controller: confirmController,
          validator: (s) {
            if (newController.text == s) return null;
            return AppStrings.passDontMatch;
          },
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
