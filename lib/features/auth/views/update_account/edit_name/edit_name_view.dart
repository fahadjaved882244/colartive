import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';

import 'package:colartive2/utils/core/app_sizes.dart';
import 'package:colartive2/utils/core/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../utils/components/fields/custom_text_form_field.dart';
import '../../../../../utils/components/scaffolds/form_scaffold.dart';
import '../../../../../utils/core/text_validator.dart';
import 'edit_name_controller.dart';

class EditNameView extends HookConsumerWidget {
  const EditNameView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editNameControllerProvider);
    final nameController = useTextEditingController();
    final bioController = useTextEditingController();

    return FormScaffold(
      title: AppStrings.editAcc,
      isLoading: state.isLoading,
      onSubmitted: () {
        ref
            .read(editNameControllerProvider.notifier)
            .updateName(name: nameController.text.trim());
      },
      children: [
        const Text(AppStrings.name),
        const SizedBox(height: Paddings.xs),
        CustomTextFormField(
          labelText: AppStrings.name,
          controller: nameController,
          keyboardType: TextInputType.name,
          validator: TextValidator.nameValidator,
          prefixIcon: const Icon(Ionicons.person_outline),
        ),
        const SizedBox(height: Paddings.md),
        const Text(AppStrings.bio),
        const SizedBox(height: Paddings.xs),
        CustomTextFormField(
          labelText: AppStrings.bio,
          controller: bioController,
          keyboardType: TextInputType.name,
          minLines: 5,
          maxLength: 300,
          prefixIcon: const Icon(Ionicons.sparkles_outline),
        ),
      ],
    );
  }
}
