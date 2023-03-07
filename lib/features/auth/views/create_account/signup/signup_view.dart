import 'package:colartive2/core_packages.dart';
import 'package:colartive2/extensions/async_value.dart';
import 'package:colartive2/features/auth/views/create_account/signup/signup_controller.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../../utils/components/buttons/custom_filled_button.dart';
import '../../../../../utils/components/fields/custom_email_field.dart';
import '../../../../../utils/components/fields/custom_password_field.dart';
import '../../../../../utils/components/fields/custom_text_form_field.dart';
import '../../../../../utils/components/scaffolds/form_scaffold.dart';
import '../../../../../utils/core/text_validator.dart';

class SignupView extends HookConsumerWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(signupControllerProvider);

    final formKey = useMemoized(GlobalKey<FormState>.new, const []);
    final autovalidateMode = useState(AutovalidateMode.onUserInteraction);

    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();

    ref.listen<AsyncValue<void>>(
      signupControllerProvider,
      (_, next) {
        next.showErrorOrNavigate(context, routeName: RouteNames.settings);
      },
    );

    void onSubmitted() {
      if (formKey.currentState?.validate() ?? false) {
        ref.read(signupControllerProvider.notifier).signup(
              email: emailController.text.trim(),
              password: passwordController.text.trim(),
              name: nameController.text.trim(),
            );
      } else {
        autovalidateMode.value = AutovalidateMode.onUserInteraction;
      }
    }

    const spacer = SizedBox(height: Paddings.md);
    return FormScaffold(
      formKey: formKey,
      autoValidateMode: autovalidateMode.value,
      title: AppStrings.signupTitle,
      isLoading: state.isLoading,
      isUpdateForm: false,
      children: [
        CustomTextFormField(
          labelText: AppStrings.name,
          controller: nameController,
          prefixIcon: const Icon(Ionicons.person_outline),
          keyboardType: TextInputType.name,
          validator: TextValidator.nameValidator,
        ),
        spacer,
        CustomEmailField(
          labelText: AppStrings.email,
          controller: emailController,
        ),
        const SizedBox(height: Paddings.sm),
        CustomPasswordField(
          labelText: AppStrings.password,
          controller: passwordController,
          validator: TextValidator.passwordValidator,
        ),
        const SizedBox(height: Paddings.sm),
        CustomPasswordField(
          labelText: AppStrings.confirmPass,
          controller: confirmPasswordController,
          validator: (a) {
            if (passwordController.text == a) {
              return null;
            }
            return AppStrings.passDontMatch;
          },
        ),
        spacer,
        CustomFilledButton(
          onPressed: !state.isLoading ? () => onSubmitted() : null,
          text: AppStrings.signup,
        ),
        const SizedBox(height: Paddings.md),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Already have an account"),
            TextButton(
              onPressed: () => context.goNamed(RouteNames.login),
              child: const CustomText(AppStrings.login),
            ),
          ],
        ),
      ],
    );
  }
}
