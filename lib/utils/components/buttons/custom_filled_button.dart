import '../../../extensions/context_x.dart';
import 'package:flutter/material.dart';

import '../../core/app_sizes.dart';
import '../widgets/custom_text.dart';

class CustomFilledButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final double elevation;
  final bool isTonal;
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
    this.heightScale = 1,
    this.width = double.maxFinite,
    this.icon,
    this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null;
    return SizedBox(
      width: width,
      height: AppSizes.tabHeight * heightScale,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(elevation),
          textStyle: MaterialStateProperty.all(
            const TextStyle(fontWeight: FontWeight.w500),
          ),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Corners.btn),
          )),
          backgroundColor: MaterialStateProperty.all(
            !enabled
                ? context.colors.onSurface.withOpacity(0.12)
                : isTonal
                    ? context.colors.secondaryContainer
                    : context.colors.primary,
          ),
          foregroundColor: MaterialStateProperty.all(
            !enabled
                ? context.colors.onSurface.withOpacity(0.38)
                : isTonal
                    ? context.colors.onSecondaryContainer
                    : context.colors.onPrimary,
          ),
        ),
        child: child ??
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) ...[
                  icon!,
                  const SizedBox(width: Paddings.xs),
                ],
                if (text != null) CustomText(text!),
              ],
            ),
      ),
    );
  }
}
