import 'package:colartive2/extensions/context_x.dart';
import 'package:colartive2/routes/app_paths.dart';
import 'package:colartive2/utils/components/cards/custom_outlined_card.dart';
import 'package:colartive2/utils/components/popups/custom_snackbar.dart';
import 'package:colartive2/utils/components/widgets/custom_list_tile.dart';
import 'package:colartive2/utils/components/widgets/custom_tile_divider.dart';
import 'package:colartive2/features/others/settings/components/change_theme_card.dart';
import 'package:colartive2/utils/core/app_sizes.dart';
import 'package:colartive2/utils/core/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';

import 'package:url_launcher/url_launcher.dart';

import 'components/user_info_card.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: Paddings.xs),
        child: Column(
          children: [
            Expanded(
                child: Center(
              child: Text(
                'ColArtive',
                style: context.textTheme.displayLarge!
                    .copyWith(fontFamily: "Lobster"),
              ),
            )),
            const UserInfoCard(),
            CustomOutlinedCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CustomListTile(
                    implyTrailing: true,
                    leading: const Icon(
                      Ionicons.star_half_outline,
                      color: Colors.amber,
                    ),
                    title: AppStrings.rateUs,
                    onTap: () async {
                      // await dialogBox(
                      //   context,
                      //   height,
                      //   width,
                      //   'Rate ColArtive',
                      //   'We see Colartive growing! Together, we can make it possible. Rate! if you like it else tell us about your suggestions and possible in-app corrections by writing a review. Anything from you is always appreciable.',
                      //   'Rate',
                      //   () async {
                      //     final url = Uri.parse(
                      //         "http://play.google.com/store/apps/details?id=com.colartive.wallpapers");
                      //     if (await canLaunchUrl(url)) {
                      //       await launchUrl(url);
                      //     } else {
                      //       throw 'Could not launch $url';
                      //     }
                      //   },
                      //   'Not Now',
                      //   () {
                      //     Navigator.pop(context);
                      //   },
                      //   topPadding: 0.67,
                      // );
                    },
                  ),
                  const CustomTileDivider(),
                  CustomListTile(
                    implyTrailing: true,
                    leading: const Icon(
                      Ionicons.shield_half_outline,
                      color: Colors.redAccent,
                    ),
                    title: AppStrings.privacyPolicy,
                    onTap: () async {
                      final url = Uri.parse(
                          'https://app.termly.io/document/privacy-policy/e25cf7ac-d97e-4eb8-bfae-56de3f3d1eb6');
                      try {
                        await launchUrl(url);
                      } catch (e) {
                        if (context.mounted) {
                          showCustomSnackBar(
                            context,
                            AppStrings.errUrl,
                          );
                        }
                      }
                    },
                  ),
                  const CustomTileDivider(),
                  CustomListTile(
                    implyTrailing: true,
                    leading: const Icon(
                      Ionicons.diamond_outline,
                      color: Colors.lightBlueAccent,
                    ),
                    title: AppStrings.subscribe,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            CustomOutlinedCard(
              child: CustomListTile(
                leading: const Icon(
                  Ionicons.planet_outline,
                  color: Colors.deepPurpleAccent,
                ),
                title: AppStrings.language,
                subtitle: AppStrings.languageDes,
                implyTrailing: true,
                onTap: () => context.go(AppPaths.updateLocale),
              ),
            ),
            const ChangeThemeCard(),
          ],
        ),
      ),
    );
  }
}
