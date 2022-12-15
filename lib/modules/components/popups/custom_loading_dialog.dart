import 'package:flutter/material.dart';

import '../../../themes/app_theme.dart';

void showLoadingDialog(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 500),
    pageBuilder: (_, __, ___) {
      return Container(
        color: AppColors.transparent,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    },
  );
}
