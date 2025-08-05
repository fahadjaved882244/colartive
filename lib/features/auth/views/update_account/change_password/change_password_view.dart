import 'package:colartive2/utils/components/widgets/custom_text.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:colartive2/utils/core/app_sizes.dart';
import 'package:colartive2/utils/core/app_strings.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../utils/components/fields/custom_password_field.dart';
import '../../../../../utils/components/scaffolds/form_scaffold.dart';
import '../../../../../utils/core/text_validator.dart';
import 'change_password_controller.dart';

class ChangePasswordView extends HookConsumerWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(changePasswordControllerProvider);

    final oldController = useTextEditingController();
    final newController = useTextEditingController();
    final confirmController = useTextEditingController();

    return FormScaffold(
      title: AppStrings.changePass,
      isLoading: state.isLoading,
      onSubmitted: () {
        ref.read(changePasswordControllerProvider.notifier).changePassword(
              old: oldController.text.trim(),
              next: newController.text.trim(),
            );
      },
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(AppStrings.current),
            const SizedBox(height: Paddings.xs),
            CustomPasswordField(
              labelText: AppStrings.currentPass,
              controller: oldController,
              validator: TextValidator.optionalPasswordValidator,
              textInputAction: TextInputAction.next,
            ),
          ],
        ),
        const SizedBox(height: Paddings.md),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(AppStrings.neww),
            const SizedBox(height: Paddings.xs),
            CustomPasswordField(
              labelText: AppStrings.newPass,
              controller: newController,
              validator: TextValidator.passwordValidator,
              textInputAction: TextInputAction.next,
            ),
          ],
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
      ],
    );
  }
}
