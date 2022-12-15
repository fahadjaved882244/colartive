import 'package:flutter/material.dart';

import '../../../themes/app_sizes.dart';

class CustomFilledButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final double elevation;
  final bool isTonal;
  final bool enabled;
  final double heightScale;
  final double width;
  final Widget? icon;
  final Widget? child;

  const CustomFilledButton({
    Key? key,
    required this.onPressed,
    this.text,
    this.elevation = 0,
    this.isTonal = false,
    this.enabled = true,
    this.heightScale = 1,
    this.width = double.maxFinite,
    this.icon,
    this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: AppSizes.tabHeight * heightScale,
      child: ElevatedButton(
        onPressed: !enabled ? null : onPressed,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(elevation),
          textStyle: MaterialStateProperty.all(
            const TextStyle(fontWeight: FontWeight.w500),
          ),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
          )),
          backgroundColor: MaterialStateProperty.all(
            !enabled
                ? Theme.of(context).colorScheme.onSurface.withOpacity(0.12)
                : isTonal
                    ? Theme.of(context).colorScheme.secondaryContainer
                    : Theme.of(context).colorScheme.primary,
          ),
          foregroundColor: MaterialStateProperty.all(
            !enabled
                ? Theme.of(context).colorScheme.onSurface.withOpacity(0.38)
                : isTonal
                    ? Theme.of(context).colorScheme.onSecondaryContainer
                    : Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        child: child ??
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) ...[
                  icon!,
                  const SizedBox(width: AppSizes.exSmallPadding),
                ],
                if (text != null) Text(text!),
              ],
            ),
      ),
    );
  }
}
