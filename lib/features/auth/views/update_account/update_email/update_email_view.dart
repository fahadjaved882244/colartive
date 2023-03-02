import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../core_packages.dart';

import '../../../../../utils/components/fields/custom_email_field.dart';
import '../../../../../utils/components/fields/custom_password_field.dart';
import '../../../../../utils/components/scaffolds/form_scaffold.dart';
import '../../../../../utils/core/text_validator.dart';
import '../../../data/utils/auth_error_handler.dart';
import 'update_email_controller.dart';

class UpdateEmailView extends HookConsumerWidget {
  const UpdateEmailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(updateEmailControllerProvider);

    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    ref.listen<AsyncValue>(
      updateEmailControllerProvider,
      (prev, next) {
        if (!next.isRefreshing && next.hasError) {
          AuthErrorHandler.handleError(context, next.error!);
        } else if (!next.isRefreshing && next.hasValue) {
          // context.go(AppPaths.profile);
        }
      },
    );

    return FormScaffold(
      title: AppStrings.updateEmail,
      isLoading: state.isLoading,
      onSubmitted: () {
        ref.read(updateEmailControllerProvider.notifier).updateEmail(
              email: emailController.text.trim(),
              password: passwordController.text.trim(),
            );
      },
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
      ],
    );
  }
}
