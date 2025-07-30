import 'package:colartive2/features/canvas_live/model/variation.dart';
import 'package:colartive2/features/template/model/template.dart';
import 'package:flutter/material.dart';

class TemplatePainter extends CustomPainter {
  final Variation variation;
  final Template template;
  final int? hintIndex;
  final double hintOpacity;
  TemplatePainter({
    super.repaint,
    required this.variation,
    required this.template,
    required this.hintIndex,
    required this.hintOpacity,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Paint the base of canvas
    final paint = Paint()
      ..color = variation.colors[0]
      ..style = PaintingStyle.fill;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, paint);

    canvas.save();

    if (variation.rotationFactor > 0) {
      canvas.translate(size.width / 2, size.height / 2);
      canvas.rotate(variation.rotationFactor * 2 * 3.141);
      canvas.translate(-size.width / 2, -size.height / 2);
    }

    paintTemplate(canvas, size);

    canvas.restore();
  }

  void paintTemplate(Canvas canvas, Size size) {
    // convert the charCodes to text
    final layers =
        template.charCodes.map((e) => String.fromCharCode(e)).toList();

    // Paint the text
    for (int i = 1; i < variation.colors.length && i < layers.length - 1; i++) {
      final textStyle = TextStyle(
        // template size
        fontSize: template.fontSize,
        // template font family
        fontFamily: template.fontFamily,
        // Make it a stroke text
        foreground: Paint()
          ..style = PaintingStyle.fill
          // ..strokeCap = StrokeCap.round
          // ..strokeWidth = 1
          ..color = i == hintIndex
              ? variation.colors[i].withValues(alpha: hintOpacity)
              : variation.colors[i]
          ..maskFilter =
              MaskFilter.blur(BlurStyle.normal, variation.blurFactor),
      );

      final textSpan = TextSpan(
        text: layers[i - 1],
        style: textStyle,
      );

      final textPainter = TextPainter(
        text: textSpan,
        textScaler: TextScaler.linear(
          variation.scaleFactor,
        ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );

      textPainter.layout();

      final offset = Offset(
        (size.width / 2) - (textPainter.width / 2),
        (size.height / 2) - (textPainter.height / 2),
      );

      textPainter.paint(canvas, offset);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
