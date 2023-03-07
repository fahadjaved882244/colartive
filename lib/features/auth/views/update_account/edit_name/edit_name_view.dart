import 'package:colartive2/extensions/async_value.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../core_packages.dart';

import '../../../../../utils/components/buttons/custom_filled_button.dart';
import '../../../../../utils/components/fields/custom_text_form_field.dart';
import '../../../../../utils/components/scaffolds/form_scaffold.dart';
import '../../../../../utils/core/text_validator.dart';
import 'edit_name_controller.dart';

class EditNameView extends HookConsumerWidget {
  const EditNameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editNameControllerProvider);
    final nameController = useTextEditingController();
    final bioController = useTextEditingController();

    ref.listen<AsyncValue<void>>(
      editNameControllerProvider,
      (_, next) {
        next.showErrorOrNavigate(context, routeName: RouteNames.settings);
      },
    );

    void onSubmitted(GlobalKey<FormState> formKey,
        ValueNotifier<AutovalidateMode> autovalidateMode) {
      if (formKey.currentState?.validate() ?? false) {
        ref
            .read(editNameControllerProvider.notifier)
            .updateName(name: nameController.text.trim());
      } else {
        autovalidateMode.value = AutovalidateMode.onUserInteraction;
      }
    }

    return FormScaffold(
      title: AppStrings.editAcc,
      isLoading: state.isLoading,
      builder: (context, formKey, autovalidateMode) => [
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
