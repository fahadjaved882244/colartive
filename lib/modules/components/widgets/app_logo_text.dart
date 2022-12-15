import 'package:flutter/material.dart';

import '../../../themes/app_theme.dart';

class AppLogoText extends StatelessWidget {
  const AppLogoText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontWeight: FontWeight.bold),
        children: [
          const TextSpan(
            text: "Halal-",
            style: TextStyle(color: AppColors.darkGray),
          ),
          const TextSpan(
            text: "Food ",
            style: TextStyle(color: AppColors.green),
          ),
          TextSpan(
            text: "(Admin)",
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
        ],
      ),
    );
  }
}
