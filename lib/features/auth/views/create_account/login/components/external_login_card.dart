import 'package:colartive2/utils/components/widgets/custom_divider_text.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../../../core_packages.dart';
import '../login_controller.dart';
import 'external_login_button.dart';

class ExternalLoginCard extends ConsumerWidget {
  final LoginController controller;
  const ExternalLoginCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(children: [
      const CustomDividerText(text: "Use your social account"),
      const SizedBox(height: Paddings.md),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ExternalLoginButton(
            text: "Google",
            icon: Icon(
              Ionicons.logo_google,
              color: context.colors.onSecondaryContainer,
            ),
            onPressed: () => controller.googleSignIn(),
          ),
          ExternalLoginButton(
            text: "Facebook",
            icon: Icon(
              Ionicons.logo_facebook,
              color: context.colors.onSecondaryContainer,
            ),
            onPressed: () => controller.facebookSignIn(),
          ),
          ExternalLoginButton(
            text: "Apple",
            icon: Icon(
              Ionicons.logo_apple,
              color: context.colors.onSecondaryContainer,
            ),
            onPressed: () => controller.appleSignIn(),
          ),
        ],
      ),
      const SizedBox(height: Paddings.md),
    ]);
  }
}
