import 'package:flutter/material.dart';

import '../../../themes/app_sizes.dart';
import '../../../themes/app_theme.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Icon? icon;
  final String? tooltip;
  final double spacing;
  final double heightScale;
  final double width;

  const CustomOutlinedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.tooltip,
    this.heightScale = 1,
    this.width = double.maxFinite,
    this.spacing = AppSizes.exSmallPadding,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: AppSizes.tabHeight * heightScale,
      child: OutlinedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            const TextStyle(fontWeight: FontWeight.w500),
          ),
          backgroundColor: MaterialStateProperty.all(AppColors.transparent),
          foregroundColor:
              MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
          )),
        ),
        child: Text(text),
      ),
    );
  }
}
