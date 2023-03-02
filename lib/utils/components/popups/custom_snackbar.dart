import 'package:flutter/material.dart';
import '../widgets/custom_text.dart';

void showCustomSnackBar<T>(final BuildContext context, final String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      showCloseIcon: true,
      behavior: SnackBarBehavior.floating,
      content: CustomText(message),
    ),
  );
}
