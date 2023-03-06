import 'dart:ui';

import 'package:colartive2/utils/core/app_colors.dart';
import 'package:flutter/material.dart';

class HomPainterView extends StatelessWidget {
  const HomPainterView({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MyPainter(),
      child: const SizedBox.expand(),
    );
  }
}

class MyPainter extends CustomPainter {
  MyPainter();

  final Paint _paint = Paint()..color = AppColors.blue;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final vertices = Vertices(
      VertexMode.triangles,
      [
        center,
        center + const Offset(200, 0),
        center + const Offset(200, 200),
        center + const Offset(0, 200),
      ],
      colors: [
        AppColors.blue,
        AppColors.blue,
        AppColors.blue,
        AppColors.blue,
      ],
      indices: [0, 1, 2, 1, 2, 3],
    );
    canvas.drawVertices(vertices, BlendMode.dst, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
