import 'package:colartive2/core_packages.dart';
import 'package:colartive2/features/auth/views/create_account/signup/signup_controller.dart';

import '../../../../../utils/components/scaffolds/form_scaffold.dart';
import 'components/signup_form.dart';

class SignupView extends ConsumerWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(signupControllerProvider);
    return FormScaffold(
      title: AppStrings.signupTitle,
      isLoading: state.isLoading,
      isUpdateForm: false,
      builder: (context, formKey, validateMode) {
        return [
          SignupForm(formKey: formKey, autovalidateMode: validateMode),
        ];
      },
    );
  }
}
