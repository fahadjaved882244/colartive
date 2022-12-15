import 'package:flutter/material.dart';
import '../../../themes/app_sizes.dart';

class BulletListTile extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final EdgeInsets? padding;
  const BulletListTile({Key? key, required this.text, this.style, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ??
          const EdgeInsets.symmetric(
            vertical: AppSizes.exSmallPadding / 2,
            horizontal: AppSizes.exSmallPadding,
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
          const SizedBox(width: AppSizes.exSmallPadding),
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
