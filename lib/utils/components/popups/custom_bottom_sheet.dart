import 'package:flutter/material.dart';
import '../../../extensions/context_x.dart';

import '../../core/app_sizes.dart';

Future<void> showCustomBottomSheet({
  required BuildContext context,
  required Widget child,
  double? height,
}) async {
  return showModalBottomSheet(
    context: context,
    elevation: 1,
    isScrollControlled: true,
    backgroundColor: context.colors.surface,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
      top: Radius.circular(Corners.btn),
    )),
    builder: (ctx) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 4,
                width: 32,
                decoration: BoxDecoration(
                  color: context.colors.onSurfaceVariant,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: child,
        ),
      ],
    ),
  );
}
