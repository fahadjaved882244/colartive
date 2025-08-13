import 'package:colartive2/extensions/context_x.dart';
import 'package:colartive2/utils/core/app_sizes.dart';
import 'package:colartive2/utils/core/app_strings.dart';
import 'package:flutter/material.dart';

import 'navigation_item.dart';

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

class CustomNavigationBar extends StatefulWidget {
  final int selectedIndex;
  final void Function(int) onChanged;

  const CustomNavigationBar(
      {super.key, required this.onChanged, required this.selectedIndex});
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
  late AnimationController controller;
  late Animation<double> curve;
  late int selectedIndex = widget.selectedIndex;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: AppTimes.md, vsync: this);
    curve = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: controller, curve: Curves.linear))
      ..addListener(() {
        setState(() {
          beaconRadius = maxBeaconRadius * curve.value;
          if (beaconRadius == maxBeaconRadius) {
            beaconRadius = 1;
            controller.reset();
          }
          if (curve.value == 0) {
            iconScale = 1;
          } else if (curve.value <= 0.5) {
            iconScale = 1.3 + curve.value;
          } else {
            iconScale = 1.8 - curve.value + (curve.value * 0.2);
          }
        });
      });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  static const List<NavigationItem> items = [
    NavigationItem(0, Icons.home_outlined, AppStrings.home),
    NavigationItem(1, Icons.search_outlined, AppStrings.search),
    NavigationItem(2, Icons.dashboard_outlined, AppStrings.showCase),
    NavigationItem(3, Icons.account_circle_outlined, AppStrings.profile),
  ];
  @override
  Widget build(context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Container(
        height: 80,
        width: double.maxFinite,
        alignment: AlignmentDirectional.center,
        padding: const EdgeInsets.symmetric(horizontal: Paddings.sm),
        decoration: BoxDecoration(
          color: context.colors.surface,
          border: Border(
            top: BorderSide(
              width: 1,
              color: context.colors.outline.withValues(alpha: 0.25),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: items.map((item) {
            var itemIndex = items.indexOf(item);
            return CustomPaint(
              painter: BeaconPainter(
                beaconRadius,
                selectedIndex == itemIndex ? maxBeaconRadius : 0,
                item.color,
                isActive: selectedIndex == itemIndex,
                offset: const Offset(36, 24),
                bgColor: context.colors.surface,
              ),
              child: GestureDetector(
                onTap: () async {
                  if (selectedIndex != itemIndex) {
                    selectedIndex = itemIndex;
                    controller.forward();
                    widget.onChanged(itemIndex);
                  }
                },
                child: CustomNavigationItem(
                  item: item,
                  curve: curve.value,
                  iconScale: iconScale,
                  isSelected: itemIndex == selectedIndex,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
