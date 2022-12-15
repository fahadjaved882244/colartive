import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../routes/route_names.dart';
import '../../../themes/app_sizes.dart';
import '../../../themes/app_theme.dart';
import '../../components/buttons/custom_filled_button.dart';
import '../../components/buttons/custom_outlined_button.dart';
import '../../components/popups/custom_snackbar.dart';
import '../../components/scaffolds/base_scaffold.dart';
import '../../components/widgets/app_logo_text.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context)
        .textTheme
        .subtitle2!
        .copyWith(color: AppColors.darkGray, fontSize: 13);
    const spacer = SizedBox(height: AppSizes.smallPadding);
    const spacerMed = SizedBox(height: AppSizes.mediumPadding);
    return BaseScaffold(
      titleWidget: const AppLogoText(),
      centerTitle: true,
      child: Column(
        children: [
          Text(
            "Manage you shops and orders on halal finder.",
            style: style,
            textAlign: TextAlign.center,
          ),
          spacerMed,
          Expanded(
              child: Image.asset(
            "assets/launcher/icon.png",
            height: 200,
            width: 200,
          )),
          spacerMed,
          Row(
            children: [
              Flexible(
                child: CustomOutlinedButton(
                  text: "Sign Up",
                  onPressed: () => Get.toNamed(RouteNames.signupView),
                ),
              ),
              const SizedBox(width: AppSizes.smallPadding),
              Flexible(
                child: CustomFilledButton(
                  isTonal: true,
                  text: "Login",
                  onPressed: () => Get.toNamed(RouteNames.loginView),
                ),
              ),
            ],
          ),
          spacerMed,
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: "Please read our ",
              style: style,
              children: <TextSpan>[
                TextSpan(
                  text: 'Terms of Use',
                  style: style.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // navigate to desired screen
                    },
                ),
                const TextSpan(text: ' and '),
                TextSpan(
                  text: 'Privacy Policy',
                  style: style.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      final url = Uri.parse(
                        "https://halalfinder.co.uk/privacy-policy/",
                      );
                      try {
                        await launchUrl(
                          url,
                          mode: LaunchMode.externalApplication,
                          webOnlyWindowName: "Privacy Policy",
                        );
                      } catch (e) {
                        showCustomSnackBar("Unable to open the Url");
                      }
                    },
                ),
                const TextSpan(text: '.'),
              ],
            ),
          ),
          spacer,
        ],
      ),
    );
  }
}
