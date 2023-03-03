import 'package:ionicons/ionicons.dart';

import '../../../../../../core_packages.dart';
import '../../../../../../routes/app_router/app_router.dart';
import '../../../../data/utils/auth_error_handler.dart';
import '../login_controller.dart';
import 'external_login_button.dart';

class ExternalLoginCard extends ConsumerWidget {
  final Function(bool) onTap;
  const ExternalLoginCard({super.key, required this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue>(
      externalLoginControllerProvider,
      (prev, next) {
        if (next.isLoading) {
          onTap(true);
        } else if (!next.isRefreshing && next.hasError) {
          onTap(false);
          AuthErrorHandler.handleError(context, next.error!);
        } else if (!next.isRefreshing && next.hasValue) {
          onTap(false);
          const SettingsRoute().go(context);
        }
      },
    );

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
            onPressed: () {
              ref.read(externalLoginControllerProvider.notifier).googleSignIn();
            },
          ),
          ExternalLoginButton(
            text: "Facebook",
            icon: Icon(
              Ionicons.logo_facebook,
              color: context.colors.onSecondaryContainer,
            ),
            onPressed: () {
              ref
                  .read(externalLoginControllerProvider.notifier)
                  .facebookSignIn();
            },
          ),
          ExternalLoginButton(
            text: "Apple",
            icon: Icon(
              Ionicons.logo_apple,
              color: context.colors.onSecondaryContainer,
            ),
            onPressed: () {
              ref.read(externalLoginControllerProvider.notifier).appleSignIn();
            },
          ),
        ],
      ),
      const SizedBox(height: Paddings.md),
    ]);
  }
}
