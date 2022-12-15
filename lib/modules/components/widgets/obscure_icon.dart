import 'package:flutter/material.dart';

import '../../../themes/app_theme.dart';

class ObscureIcon extends StatelessWidget {
  final bool isObscure;
  final VoidCallback onTap;
  const ObscureIcon({
    Key? key,
    required this.isObscure,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isObscure ? Icons.visibility_off : Icons.visibility,
        color: isObscure
            ? AppColors.darkGray
            : Theme.of(context).colorScheme.primary,
      ),
      onPressed: onTap,
    );
  }
}
