import 'package:flutter/material.dart';

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
