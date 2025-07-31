import 'package:flutter/material.dart';
import '../../core/app_sizes.dart';

class BulletListTile extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final EdgeInsets? padding;
  const BulletListTile(
      {super.key, required this.text, this.style, this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ??
          const EdgeInsets.symmetric(
            vertical: Paddings.xs / 2,
            horizontal: Paddings.xs,
          ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '\u2022',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(width: Paddings.xs),
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: style,
            ),
          ),
        ],
      ),
    );
  }
}
