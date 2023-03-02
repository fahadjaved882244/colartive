import 'package:colartive2/utils/components/cards/custom_outlined_card.dart';
import 'package:colartive2/utils/components/widgets/custom_list_tile.dart';
import 'package:colartive2/utils/components/widgets/custom_tile_divider.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../core_packages.dart';
import '../../../../utils/controllers/theme_controller.dart';

class ChangeThemeCard extends ConsumerWidget {
  const ChangeThemeCard({super.key});

  void onThemeSwitched(WidgetRef ref, bool value) {
    ref.read(themeControllerProvider.notifier).setDarkModeFlag(value);
  }

  void onCheckForeMode(WidgetRef ref, bool? value) {
    if (value != null) {
      ref.read(themeControllerProvider.notifier).setForceModeFlag(value);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeControllerProvider);
    return CustomOutlinedCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CustomListTile(
            enabled: !themeState.isForceMode,
            title: AppStrings.darkMode,
            leading: const Icon(Ionicons.moon),
            trailing: Switch.adaptive(
              value: themeState.isForceMode ? false : themeState.isDarkMode,
              onChanged: (value) =>
                  !themeState.isForceMode ? onThemeSwitched(ref, value) : null,
            ),
          ),
          const CustomTileDivider(),
          CustomListTile(
            leading: const Icon(
              Ionicons.sync_outline,
              color: Colors.blueGrey,
            ),
            title: AppStrings.sync,
            subtitle: AppStrings.syncDes,
            trailing: Checkbox(
              value: themeState.isForceMode,
              onChanged: (value) => onCheckForeMode(ref, value),
            ),
          ),
        ],
      ),
    );
  }
}
