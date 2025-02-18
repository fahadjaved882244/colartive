import 'package:colartive2/features/canvas_live/views/canvas_live_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const List<int> charCodes = [
  0xe800,
  0xe801,
  0xe802,
  0xe803,
  0xe804,
  0xe805,
  0xe806,
];

class CanvasLiveCard extends ConsumerWidget {
  const CanvasLiveCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(canvasLiveControllerProvider).colors;
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      clipBehavior: Clip.antiAlias,
      child: colors.isNotEmpty
          ? CustomPaint(
              painter: RectanglePainter(
                colors: colors,
                charCodes: charCodes,
              ),
            )
          : const Card(
              elevation: 0,
              child: Center(
                child: Text(
                  'To Create Your Own Wallpaper:\nChoose Colors Below\n\nor\n\nTo Modify Sample Palettes:\nSwipe Left / Right',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    // color: darkModeFlag ? darkModeColor : lightModeColor,
                    // fontSize: width * 0.04,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'arial_48',
                  ),
                ),
              ),
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
          ..style = i % 2 == 0 ? PaintingStyle.stroke : PaintingStyle.fill
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
