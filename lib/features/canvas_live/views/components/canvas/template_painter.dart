import 'package:flutter/material.dart';

import 'package:colartive2/features/canvas_live/model/variation.dart';
import 'package:colartive2/features/template/model/template.dart';

class TemplatePainter extends CustomPainter {
  final Variation variation;
  final Template template;
  final int? hintIndex;
  final double hintOpacity;
  final bool paintOverlay;
  final bool isCanvasFull;
  TemplatePainter({
    super.repaint,
    required this.variation,
    required this.template,
    required this.hintIndex,
    required this.hintOpacity,
    required this.isCanvasFull,
    this.paintOverlay = false,
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

    if (paintOverlay) {
      paintOverlayText(canvas, size);
    }
  }

  void paintTemplate(Canvas canvas, Size size) {
    // convert the charCodes to text
    final layers =
        template.charCodes.map((e) => String.fromCharCode(e)).toList();

    // Paint the text
    double fontSize = template.fontSize * variation.scaleFactor;
    if (isCanvasFull) {
      final canvasScale = size.width / (size.width * 0.65);
      fontSize *= canvasScale;
    }
    for (int i = 1; i < variation.colors.length && i < layers.length - 1; i++) {
      final textStyle = TextStyle(
        // template size scaled to canvas size
        fontSize: fontSize,
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

  // paint the overlay text
  void paintOverlayText(Canvas canvas, Size size) {
    double scale = 1;
    if (isCanvasFull) {
      scale = size.width / (size.width * 0.65);
    }
    for (final overlay in variation.overlayTexts) {
      final textStyle = TextStyle(
        color: overlay.color,
        fontSize: overlay.fontSize * scale,
        fontFamily: overlay.fontFamily,
        fontWeight: FontWeight.bold,
      );
      final textSpan = TextSpan(
        text: overlay.text,
        style: textStyle,
      );
      final textPainter = TextPainter(
        text: textSpan,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
        maxLines: 20,
      );
      textPainter.layout();

      final offset = Offset(
        (overlay.posX * size.width) - (textPainter.width / 2),
        (overlay.posY * size.height) - (textPainter.height / 2),
      );

      // manage the rotation of the overlay text
      if (overlay.rotation != 0) {
        canvas.save();

        final x = offset.dx + (textPainter.width / 2);
        final y = offset.dy + (textPainter.height / 2);
        canvas.translate(x, y);
        canvas.rotate(overlay.rotation * 2 * 3.141);
        canvas.translate(-x, -y);
      }

      textPainter.paint(canvas, offset);

      if (overlay.rotation != 0) {
        canvas.restore();
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  // Future<bool> toPngBytes(Size size, double dpr) async {
  //   try {
  //     double height = size.height * dpr;
  //     double width = size.width * dpr;
  //     double fact = 1;
  //     // if (qltyValue == 0) {
  //     //   fact = 720 / sizeHorizontal;
  //     //   height = height * fact;
  //     //   width = width * fact;
  //     // } else if (qltyValue == 1) {
  //     //   fact = 1080 / sizeHorizontal;
  //     //   height = height * fact;
  //     //   width = width * fact;
  //     // } else if (qltyValue == 2) {
  //     //   fact = 2160 / sizeHorizontal;
  //     //   height = height * fact;
  //     //   width = width * fact;
  //     // }
  //     final recorder = ui.PictureRecorder();
  //     final picture = recorder.endRecording();
  //     final renderedImage =
  //         await picture.toImage(width.toInt(), height.toInt());
  //     image = renderedImage;
  //     imageBytesData = await image.toByteData(format: ui.ImageByteFormat.png);

  //     return true;
  //   } catch (ex) {
  //     print('DoublePngBytes: $ex');
  //   }
  //   return false;
  // }
}
