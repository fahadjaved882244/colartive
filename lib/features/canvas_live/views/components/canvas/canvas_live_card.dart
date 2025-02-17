import 'package:flutter/material.dart';

const colors = [
  0xff000000,
  0xff09090b,
  0xff0e5428,
  0xff555455,
  0xfff5f4f5,
  0xffe0e0e3,
  0xff00EE76,
  0xff0e5428
];

const List<int> charCodes = [
  0xe800,
  0xe801,
  0xe802,
  0xe803,
  0xe804,
  0xe805,
  0xe806,
];

class CanvasLiveCard extends StatelessWidget {
  const CanvasLiveCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: RectanglePainter(
        colors: colors.map((c) => Color(c)).toList(),
        charCodes: charCodes,
      ),
    );
  }
}

class RectanglePainter extends CustomPainter {
  final List<Color> colors;
  final List<int> charCodes;
  RectanglePainter({
    super.repaint,
    required this.colors,
    required this.charCodes,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Paint the base of canvas
    final paint = Paint()
      ..color = colors[0]
      ..style = PaintingStyle.fill;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, paint);

    // convert the charCodes to text
    final layers = charCodes.map((e) => String.fromCharCode(e)).toList();

    // Paint the text
    for (int i = 1; i < colors.length; i++) {
      final textStyle = TextStyle(
        // color: colors[i],
        fontSize: 220, // Adjust the font size according to the Template
        fontFamily: "Deadpool",
        // Make it a stroke text
        foreground: Paint()
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round
          ..strokeWidth = 1
          ..color = colors[i],
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

      textPainter.layout(
        minWidth: 0,
        maxWidth: size.width,
      );

      final offset = Offset(
        (size.width - textPainter.width) / 2,
        (size.height - textPainter.height) / 1.75,
      );

      textPainter.paint(canvas, offset);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
