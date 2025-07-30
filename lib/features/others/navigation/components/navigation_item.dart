import 'package:colartive2/extensions/context_x.dart';
import 'package:colartive2/utils/components/widgets/custom_text.dart';
import 'package:colartive2/utils/core/app_colors.dart';
import 'package:flutter/material.dart';

class NavigationItem {
  final int id;
  final IconData icon;
  final String title;
  final Color color;
  const NavigationItem(this.id, this.icon, this.title,
      {this.color = AppColors.primary});
}

class CustomNavigationItem extends StatelessWidget {
  final NavigationItem item;
  final double iconScale;
  final double curve;
  final bool isSelected;
  const CustomNavigationItem({
    super.key,
    required this.item,
    required this.isSelected,
    required this.iconScale,
    required this.curve,
  });

  @override
  Widget build(BuildContext context) {
    final inActiveColor = context.colors.onSurfaceVariant;
    return SizedBox(
      width: 72,
      height: 64,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Transform.scale(
            scale: isSelected ? iconScale : 1,
            child: Icon(
              item.icon,
              size: 28,
              color: Color.lerp(
                isSelected ? item.color : inActiveColor.withValues(alpha: 0.7),
                inActiveColor.withValues(alpha: 0.7),
                curve,
              ),
            ),
          ),
          const SizedBox(height: 4),
          if (isSelected)
            CustomText(
              item.title,
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.clip,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Color.lerp(
                      isSelected
                          ? item.color
                          : inActiveColor.withValues(alpha: 0.7),
                      inActiveColor.withValues(alpha: 0.7),
                      curve,
                    ),
                    fontFamily: "SummerPixel",
                  ),
            )
        ],
      ),
    );
  }
}
