import 'package:colartive2/modules/navigation/navigation_controller.dart';
import 'package:colartive2/themes/app_sizes.dart';
import 'package:colartive2/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BeaconPainter extends CustomPainter {
  final double beaconRadius;
  final double maxBeaconRadius;
  final Color beaconColor;
  final Color bgColor;
  final bool isActive;
  final Offset offset;

  BeaconPainter(this.beaconRadius, this.maxBeaconRadius, this.beaconColor,
      {this.isActive = false, required this.offset, required this.bgColor});

  @override
  void paint(Canvas canvas, Size size) {
    final endColor = Color.lerp(beaconColor, bgColor, 0.5);
    if (beaconRadius < maxBeaconRadius) {
      var progress = beaconRadius / maxBeaconRadius;
      double strokeWidth = beaconRadius < maxBeaconRadius * 0.5
          ? beaconRadius
          : maxBeaconRadius - beaconRadius;
      final paint = Paint()
        ..color = Color.lerp(bgColor, endColor, progress) ?? bgColor
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.stroke;
      canvas.drawCircle(offset, beaconRadius, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class NavigationItem {
  final int id;
  final IconData icon;
  final String title;
  final Color color;
  NavigationItem(this.id, this.icon, this.title, this.color);
}

class CustomNavigationBar extends StatefulWidget {
  final void Function(int) onChanged;

  const CustomNavigationBar({super.key, required this.onChanged});
  @override
  State<StatefulWidget> createState() {
    return CustomNavigationBarState();
  }
}

class CustomNavigationBarState extends State<CustomNavigationBar>
    with TickerProviderStateMixin {
  double beaconRadius = 1;
  double maxBeaconRadius = 24;
  double iconScale = 1;
  late AnimationController _controller;
  late Animation<double> _curve;
  final controller = Get.find<NavigationController>();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 350), vsync: this);
    _curve = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linear))
      ..addListener(() {
        setState(() {
          beaconRadius = maxBeaconRadius * _curve.value;
          if (beaconRadius == maxBeaconRadius) {
            beaconRadius = 1;
            _controller.reset();
          }
          if (_curve.value == 0) {
            iconScale = 1;
          } else if (_curve.value <= 0.5) {
            iconScale = 1.3 + _curve.value;
          } else {
            iconScale = 1.8 - _curve.value + (_curve.value * 0.2);
          }
        });
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final List<NavigationItem> items = [
    NavigationItem(1, Icons.menu_outlined, 'Menu', AppColors.menuColor),
    NavigationItem(2, Icons.home_outlined, 'Home', AppColors.homeColor),
    NavigationItem(
        3, Icons.wallpaper_outlined, 'Saved', AppColors.galleryColor),
  ];

  Widget _buildNavigationItem(NavigationItem item, bool isSelected) {
    final inActiveColor = Theme.of(context).colorScheme.onSurfaceVariant;
    return Container(
      width: 48,
      color: Colors.transparent,
      alignment: AlignmentDirectional.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Stack(
            alignment: Alignment.topRight,
            children: <Widget>[
              Transform.scale(
                scale: isSelected ? iconScale : 1,
                child: Icon(
                  item.icon,
                  color: Color.lerp(
                      isSelected ? item.color : inActiveColor.withOpacity(0.7),
                      inActiveColor.withOpacity(0.7),
                      _curve.value),
                  size: 16,
                ),
              ),
              // TODO: Gallery Indicator
              if (item.id == 3)
                const Positioned(
                  right: -3,
                  top: -5,
                  child: Icon(
                    Icons.brightness_1,
                    size: AppSizes.exSmallIconSize,
                    color: Colors.red,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            item.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Color.lerp(
                    isSelected ? item.color : inActiveColor.withOpacity(0.7),
                    inActiveColor.withOpacity(0.7),
                    _curve.value,
                  ),
                ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(context) {
    return Obx(
      () {
        return Container(
          height: 80,
          width: double.maxFinite,
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            border: Border(
              top: BorderSide(color: Theme.of(context).colorScheme.outline),
            ),
          ),
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: items.map((item) {
              var itemIndex = items.indexOf(item);
              return CustomPaint(
                painter: BeaconPainter(
                  beaconRadius,
                  controller.selectedIndex == itemIndex ? maxBeaconRadius : 0,
                  item.color,
                  isActive: controller.selectedIndex == itemIndex,
                  offset: const Offset(16, 16),
                  bgColor: Theme.of(context).colorScheme.surface,
                ),
                child: GestureDetector(
                  onTap: () async {
                    if (controller.selectedIndex != itemIndex) {
                      controller.selectedIndex = itemIndex;
                      _controller.forward();
                      widget.onChanged(itemIndex);
                    }
                  },
                  child: _buildNavigationItem(
                    item,
                    itemIndex == controller.selectedIndex,
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
