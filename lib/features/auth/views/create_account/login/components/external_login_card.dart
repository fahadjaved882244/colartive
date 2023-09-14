import 'package:ionicons/ionicons.dart';

import '../../../../../../core_packages.dart';
import '../login_controller_view.dart';
import 'external_login_button.dart';

class ExternalLoginCard extends ConsumerWidget {
  const ExternalLoginCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginControllerProvider);
    return Column(children: [
      const Row(children: [
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
            onPressed: () async {
              // await controller.googleLoginPressed();
            },
          ),
          ExternalLoginButton(
            text: "Facebook",
            icon: Icon(
              Ionicons.logo_facebook,
              color: context.colors.onSecondaryContainer,
            ),
            onPressed: () async {
              // await controller.facebookLoginPressed();
            },
          ),
          ExternalLoginButton(
            text: "Apple",
            icon: Icon(
              Ionicons.logo_apple,
              color: context.colors.onSecondaryContainer,
            ),
            onPressed: () async {
              // await controller.appleLoginPressed();
            },
          ),
        ],
      ),
      const SizedBox(height: Paddings.md),
    ]);
  }
}
