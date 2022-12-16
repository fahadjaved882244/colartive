import 'package:colartive2/services/basic/theme_service.dart';
import 'package:colartive2/themes/app_sizes.dart';
import 'package:colartive2/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vector_math/vector_math.dart' as vm;
import 'package:url_launcher/url_launcher.dart';

class DrawerView extends GetView<ThemeController> {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    customCard({required Widget child}) {
      return Card(
        elevation: 0,
        color: Theme.of(context).colorScheme.surfaceVariant,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.cardRadius),
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline.withOpacity(0.5),
            width: 0.2,
          ),
        ),
        child: child,
      );
    }

    customListTile({
      required String title,
      String? subtitle,
      IconData? icon,
      Widget? iconWidget,
      Color? iconColor,
      IconData? trailingIcon,
      Widget? trailing,
      VoidCallback? onTap,
      bool enabled = true,
    }) {
      return ListTile(
        enabled: enabled,
        tileColor: AppColors.transparent,
        title: Text(title),
        subtitle: subtitle != null
            ? Text(
                subtitle,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant),
              )
            : null,
        leading: iconWidget ??
            Icon(icon, color: iconColor, size: AppSizes.mediumPadding),
        trailing: trailing ?? Icon(trailingIcon),
        onTap: onTap,
      );
    }

    customDivider() {
      return const Divider(
        height: 0,
        indent: 60,
        // endIndent: 16,
        thickness: 0.5,
      );
    }

    spacer() {
      return const SizedBox(height: AppSizes.smallPadding);
    }

    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Center(
            child: Text(
              'ColArtive',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          )),
          customCard(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                customListTile(
                  icon: Icons.star,
                  iconColor: Colors.amber,
                  title: "Rate us!",
                  trailingIcon: Icons.arrow_right,
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
                customDivider(),
                customListTile(
                  icon: Icons.security,
                  iconColor: Colors.redAccent,
                  title: "Privacy policy",
                  trailingIcon: Icons.arrow_right,
                  onTap: () async {
                    final url = Uri.parse(
                        'https://app.termly.io/document/privacy-policy/e25cf7ac-d97e-4eb8-bfae-56de3f3d1eb6');
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
                customDivider(),
                customListTile(
                  icon: Icons.diamond_outlined,
                  iconColor: const Color(0xff70d1f4),
                  title: "Subscribe",
                  trailingIcon: Icons.arrow_right,
                  onTap: () async {
                    // Navigator.push(context,
                    //     SlideTransitionBuilder(widget: Subscription()));
                  },
                ),
              ],
            ),
          ),
          spacer(),
          customCard(
            child: customListTile(
              icon: Icons.control_point_duplicate,
              iconColor: Colors.deepPurpleAccent,
              title: 'Color shades',
              subtitle: 'Categorize shades of each color.',
              trailing: Switch.adaptive(
                value: true,
                onChanged: (value) async {
                  // setState(() {
                  //   shadesFlag = value;
                  // });
                  // await storeShadesFlag(shadesFlag);
                },
                // activeTrackColor: Colors.blue,
                // activeColor: darkModeFlag ? darkModeColor : lightModeColor,
                // inactiveTrackColor: Colors.grey,
                // inactiveThumbColor:
                //     darkModeFlag ? darkModeColor : lightModeColor,
              ),
            ),
          ),
          spacer(),
          customCard(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                customListTile(
                  title: 'Dark mode',
                  subtitle: 'Sync mode with your device.',
                  iconWidget: Transform.rotate(
                    angle: vm.radians(135),
                    child: const Icon(Icons.brightness_2),
                  ),
                  iconColor: Theme.of(context).colorScheme.onSurface,
                  trailing: Obx(
                    () => Checkbox(
                      value: controller.forceMode,
                      onChanged: (value) {
                        if (value != null) controller.forceMode = value;
                      },
                    ),
                  ),
                ),
                customDivider(),
                Obx(
                  () => customListTile(
                    enabled: !controller.forceMode,
                    iconWidget: const SizedBox(),
                    title: 'Turn on/off dark mode',
                    trailing: Switch.adaptive(
                      value:
                          controller.forceMode ? false : controller.isDarkMode,
                      onChanged: !controller.forceMode
                          ? (value) async {
                              controller.isDarkMode = value;
                            }
                          : null,
                    ),
                  ),
                ),
              ],
            ),
          ),
          spacer(),
        ],
      ),
    );
  }
}
