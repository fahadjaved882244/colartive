import 'package:colartive2/features/auth/views/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ionicons/ionicons.dart';

import 'package:colartive2/routes/app_navigation.dart';
import 'package:colartive2/utils/core/app_sizes.dart';
import 'package:colartive2/utils/core/app_strings.dart';

import '../../../../../utils/components/cards/custom_outlined_card.dart';
import '../../../../../utils/components/popups/custom_dialog.dart';
import '../../../../../utils/components/scaffolds/base_scaffold.dart';
import '../../../../../utils/components/widgets/custom_list_tile.dart';
import 'components/update_user_image.dart';

class UpdateProfileView extends StatelessWidget {
  const UpdateProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    const divider = Divider(
      height: 0,
      indent: 60,
      thickness: 0.5,
    );
    return BaseScaffold(
      title: AppStrings.userAcc,
      noPadding: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Paddings.xs),
        child: Column(
          children: [
            const Expanded(child: Center(child: UpdateUserImage())),
            CustomOutlinedCard(
              child: Column(
                children: [
                  CustomListTile(
                    title: AppStrings.editAcc,
                    leading: const Icon(Ionicons.person_circle),
                    implyTrailing: true,
                    onTap: () => context.goEditName(),
                  ),
                  divider,
                  CustomListTile(
                    title: AppStrings.updateEmail,
                    leading: const Icon(Ionicons.mail_outline),
                    implyTrailing: true,
                    onTap: () => context.goUpdateEmail(),
                  ),
                  divider,
                  CustomListTile(
                    title: AppStrings.changePass,
                    leading: const Icon(Ionicons.lock_closed_outline),
                    implyTrailing: true,
                    onTap: () => context.goChangePassword(),
                  ),
                ],
              ),
            ),
            Consumer(
              builder: (context, ref, child) {
                return CustomOutlinedCard(
                  child: CustomListTile(
                    title: AppStrings.logout,
                    leading: const Icon(Icons.logout),
                    implyTrailing: false,
                    onTap: () => onLogoutPresses(context, ref),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onLogoutPresses(BuildContext context, WidgetRef ref) async {
    final result = await showCustomDialog(
      context: context,
      title: "Confirm Logout",
      subTitle: "Are you sure you want to logout?",
      rightButtonTitle: "Logout",
      leftButtonTitle: "Cancel",
    );
    if (result && context.mounted) {
      // await GetStorage().erase();
      ref.read(authRepositoryProvider).signOut().then((_) {
        if (context.mounted) {
          context.goHome();
        }
      });
    }
  }
}
