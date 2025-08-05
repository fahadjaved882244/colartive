import '../../../extensions/context_x.dart';
import 'package:flutter/material.dart';

import '../../core/app_colors.dart';

class AppLogoText extends StatelessWidget {
  const AppLogoText({super.key});

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
            style: TextStyle(color: context.colors.primary),
          ),
        ],
      ),
    );
  }
}
