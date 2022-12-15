import 'package:flutter/material.dart';

import '../../../../services/auth/auth_validator.dart';
import '../../../components/scaffolds/form_scaffold.dart';
import '../../../components/widgets/custom_text_form_field.dart';
import 'forgot_password_controller.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormScaffold<ForgotPasswordController>(
      title: 'Forgot your password',
      isUpdateForm: false,
      builder: ((controller) {
        return [
          CustomTextFormField(
            labelText: "Email",
            controller: controller.emailController,
            keyboardType: TextInputType.emailAddress,
            validator: AuthValidator.emailValidator,
            textInputAction: TextInputAction.done,
            prefixIcon: const Icon(Icons.email),
            helperText:
                "Reset-password email will be sent to your email address.",
            onSubmitted: (_) async => await controller.submitForm(),
          ),
        ];
      }),
    );
  }
}
