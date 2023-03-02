import 'package:flutter/material.dart';
import '../../../extensions/context_x.dart';

import '../../core/app_sizes.dart';

class CustomIconButton extends StatelessWidget {
  final Widget icon;
  final Color? backgroundColor;
  final void Function()? onPressed;
  const CustomIconButton({
    Key? key,
    required this.icon,
    this.onPressed,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      margin: const EdgeInsets.symmetric(horizontal: Paddings.xs),
      decoration: BoxDecoration(
        color: backgroundColor ?? context.colors.surface,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        icon: icon,
      ),
    );
  }
}
