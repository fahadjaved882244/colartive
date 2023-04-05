import 'package:colartive2/extensions/base_state_x.dart';
import 'package:colartive2/features/auth/views/auth_controller.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../core_packages.dart';

import '../../../../../utils/components/buttons/custom_filled_button.dart';
import '../../../../../utils/components/fields/custom_text_form_field.dart';
import '../../../../../utils/components/scaffolds/form_scaffold.dart';
import '../../../../../utils/core/text_validator.dart';
import '../../../../../utils/state/base_state.dart';
import 'update_user_details_controller.dart';

class UpdateUserDetailsView extends HookConsumerWidget {
  const UpdateUserDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(updateUserDetailsControllerProvider);
    final user = ref.watch(authControllerProvider).toNullable();

    final formKey = useMemoized(GlobalKey<FormState>.new, const []);
    final autovalidateMode = useState(AutovalidateMode.disabled);
    final nameController = useTextEditingController(text: user?.name);
    final bioController = useTextEditingController(text: user?.bio);

    ref.listen<BaseState>(
      updateUserDetailsControllerProvider,
      (_, next) {
        next.showErrorOrSuccOrNav(
          context,
          routeName: RouteNames.userProfile,
          success: AppStrings.userUpdated,
        );
      },
    );

    void onSubmitted(GlobalKey<FormState> formKey,
        ValueNotifier<AutovalidateMode> autovalidateMode) {
      if (formKey.currentState?.validate() ?? false) {
        ref.read(updateUserDetailsControllerProvider.notifier).updateDetails(
              name: nameController.text.trim(),
              bio: bioController.text.trim(),
            );
      } else {
        autovalidateMode.value = AutovalidateMode.onUserInteraction;
      }
    }

    return FormScaffold(
      formKey: formKey,
      autovalidateMode: autovalidateMode.value,
      title: AppStrings.editAcc,
      isLoading: state.isLoading,
      children: [
        CustomTextFormField(
          labelText: AppStrings.name,
          controller: nameController,
          keyboardType: TextInputType.name,
          validator: TextValidator.nameValidator,
        ),
        const SizedBox(height: Paddings.md),
        CustomTextFormField(
          labelText: AppStrings.bio,
          controller: bioController,
          keyboardType: TextInputType.name,
          minLines: 5,
          maxLength: 300,
        ),
        const SizedBox(height: Paddings.md),
        CustomFilledButton(
          onPressed: !state.isLoading
              ? () => onSubmitted(formKey, autovalidateMode)
              : null,
          text: AppStrings.save,
        ),
      ],
    );
  }
}
