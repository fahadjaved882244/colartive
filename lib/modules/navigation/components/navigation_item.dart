import 'package:colartive2/themes/app_sizes.dart';
import 'package:flutter/material.dart';

class NavigationItem {
  final int id;
  final IconData icon;
  final String title;
  final Color color;
  NavigationItem(this.id, this.icon, this.title, this.color);
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
    final inActiveColor = Theme.of(context).colorScheme.onSurfaceVariant;
    return SizedBox(
      width: 72,
      height: 64,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(
            alignment: Alignment.topRight,
            children: <Widget>[
              Transform.scale(
                scale: isSelected ? iconScale : 1,
                child: Icon(
                  item.icon,
                  size: 28,
                  color: Color.lerp(
                    isSelected ? item.color : inActiveColor.withOpacity(0.7),
                    inActiveColor.withOpacity(0.7),
                    curve,
                  ),
                ),
              ),
              // TODO: Gallery Indicator
              if (item.id == 2)
                const Icon(
                  Icons.brightness_1,
                  size: AppSizes.exSmallIconSize,
                  color: Colors.red,
                ),
            ],
          ),
          Text(
            item.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Color.lerp(
                    isSelected ? item.color : inActiveColor.withOpacity(0.7),
                    inActiveColor.withOpacity(0.7),
                    curve,
                  ),
                ),
          )
        ],
      ),
    );
  }
}
