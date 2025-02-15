import 'package:colartive2/extensions/context_x.dart';
import 'package:colartive2/utils/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ionicons/ionicons.dart';

import 'package:colartive2/utils/core/app_sizes.dart';

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
