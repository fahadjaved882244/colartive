import 'package:ionicons/ionicons.dart';

import 'package:colartive2/routes/app_paths.dart';
import 'package:colartive2/utils/core/app_sizes.dart';
import 'package:colartive2/utils/core/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../../utils/components/cards/custom_outlined_card.dart';
import '../../../../../utils/components/popups/custom_dialog.dart';
import '../../../../../utils/components/scaffolds/base_scaffold.dart';
import '../../../../../utils/components/widgets/custom_list_tile.dart';
import 'components/update_user_image.dart';

class UpdateProfileView extends StatelessWidget {
  const UpdateProfileView({Key? key}) : super(key: key);

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
                    onTap: () => context.go(AppPaths.editName),
                  ),
                  divider,
                  CustomListTile(
                    title: AppStrings.updateEmail,
                    leading: const Icon(Ionicons.mail_outline),
                    implyTrailing: true,
                    onTap: () => context.go(AppPaths.updateEmail),
                  ),
                  divider,
                  CustomListTile(
                    title: AppStrings.changePass,
                    leading: const Icon(Ionicons.lock_closed_outline),
                    implyTrailing: true,
                    onTap: () => context.go(AppPaths.changePassword),
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

  onLogoutPresses(BuildContext context, WidgetRef ref) async {
    final result = await showCustomDialog(
      context: context,
      title: "Confirm Logout",
      subTitle: "Are you sure you want to logout?",
      rightButtonTitle: "Logout",
      leftButtonTitle: "Cancel",
    );
    if (result && context.mounted) {
      // await GetStorage().erase();
      // ref.read(authControllerProvider);
      context.go(AppPaths.home);
    }
  }
}
