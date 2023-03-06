import 'package:colartive2/utils/components/cards/custom_outlined_card.dart';
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
          SwitchListTile.adaptive(
            controlAffinity: ListTileControlAffinity.trailing,
            value: themeState.isForceMode ? false : themeState.isDarkMode,
            onChanged: (value) =>
                !themeState.isForceMode ? onThemeSwitched(ref, value) : null,
            title: const CustomText(AppStrings.darkMode),
            secondary: const Icon(Ionicons.moon),
          ),
          const CustomTileDivider(),
          CheckboxListTile(
            value: themeState.isForceMode,
            onChanged: (value) => onCheckForeMode(ref, value),
            title: const CustomText(AppStrings.sync),
            subtitle: const CustomText(AppStrings.syncDes),
            secondary: const Icon(
              Ionicons.sync_outline,
              color: Colors.blueGrey,
            ),
          ),
        ],
      ),
    );
  }
}
