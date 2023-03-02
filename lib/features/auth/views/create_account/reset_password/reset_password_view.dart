import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../../core_packages.dart';
import '../../../../../utils/components/fields/custom_email_field.dart';
import '../../../../../utils/components/scaffolds/form_scaffold.dart';
import '../../../data/utils/auth_error_handler.dart';
import 'reset_password_controller.dart';

class ResetPasswordView extends HookConsumerWidget {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(resetPasswordControllerProvider);

    final emailController = useTextEditingController();

    ref.listen<AsyncValue>(
      resetPasswordControllerProvider,
      (prev, next) {
        if (!next.isRefreshing && next.hasError) {
          AuthErrorHandler.handleError(context, next.error!);
        }
      },
    );

    void onSubmitForm() {
      ref
          .read(resetPasswordControllerProvider.notifier)
          .resetPassword(email: emailController.text.trim());
    }

    return FormScaffold(
        title: AppStrings.resetPass,
        isUpdateForm: false,
        isLoading: state.isLoading,
        onSubmitted: () => onSubmitForm(),
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
          ),
        ]);
  }
}
