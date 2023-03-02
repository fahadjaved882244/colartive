import 'package:flutter/material.dart';
import '../../../extensions/context_x.dart';

import '../../core/app_sizes.dart';

class CustomOutlinedCard extends StatelessWidget {
  final Widget child;
  final Color? outlineColor;
  const CustomOutlinedCard({super.key, required this.child, this.outlineColor});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Corners.crd),
        side: BorderSide(
          color: outlineColor ?? context.colors.outline.withOpacity(0.5),
          width: 1,
        ),
      ),
      child: child,
    );
  }
}
