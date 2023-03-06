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
      Row(children: const [
        Expanded(child: Divider()),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Paddings.sm),
          child: Text(
            "Use your social account",
            style: TextStyle(
              color: AppColors.darkGray,
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Expanded(child: Divider()),
      ]),
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
