import 'package:colartive2/extensions/base_state_x.dart';
import 'package:colartive2/utils/state/base_state.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../../../core_packages.dart';
import '../../../../../utils/components/cards/custom_outlined_card.dart';
import '../../../../../utils/components/popups/custom_dialog.dart';
import '../../../../../utils/components/scaffolds/base_scaffold.dart';
import '../../../../../utils/components/widgets/custom_list_tile.dart';
import '../../../../../utils/components/widgets/custom_tile_divider.dart';
import 'components/update_user_image.dart';
import 'update_profile_controller.dart';

class UpdateProfileView extends ConsumerWidget {
  const UpdateProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<BaseState>(
      updateProfileControllerProvider,
      (_, next) {
        next.showErrorOrNav(context, RouteNames.settings);
      },
    );

    return BaseScaffold(
      title: AppStrings.userAcc,
      child: Padding(
        padding: const EdgeInsets.all(Paddings.xs),
        child: Column(
          children: [
            const Spacer(),
            const UpdateUserImage(),
            const Spacer(),
            CustomOutlinedCard(
              child: Column(
                children: [
                  CustomListTile(
                    title: AppStrings.editAcc,
                    leading: const Icon(Ionicons.person_circle),
                    implyTrailing: true,
                    onTap: () => context.goNamed(AppPaths.editName),
                  ),
                  const CustomTileDivider(),
                  CustomListTile(
                    title: AppStrings.updateEmail,
                    leading: const Icon(Ionicons.mail_outline),
                    implyTrailing: true,
                    onTap: () => context.goNamed(RouteNames.updateEmail),
                  ),
                  const CustomTileDivider(),
                  CustomListTile(
                    title: AppStrings.changePass,
                    leading: const Icon(Ionicons.lock_closed_outline),
                    implyTrailing: true,
                    onTap: () => context.goNamed(RouteNames.changePassword),
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
      ref.read(updateProfileControllerProvider.notifier).signOut();
    }
  }
}
