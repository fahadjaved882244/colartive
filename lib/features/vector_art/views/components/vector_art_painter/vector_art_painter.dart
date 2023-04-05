import 'package:flutter/material.dart';

import '../../../model/base_models/vector_scaffold.dart';
import '../../../model/base_models/vector_skin.dart';

class VectorArtPainter extends CustomPainter {
  final VectorScaffold vectorScaffold;
  final VectorSkin vectorSkin;

  VectorArtPainter({
    super.repaint,
    required this.vectorScaffold,
    required this.vectorSkin,
  }) : colors = vectorSkin.colorPalette.map((e) => Color(e)).toList();
  final List<Color> colors;

  final _paint = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    // painting background

    _paint.color = colors[0];
    canvas.drawRect(Rect.fromLTRB(0, 0, size.width, size.height), _paint);

    // if(colors.length > 2){
    //   grad = [
    //   LinearGradient(
    //     begin: Alignment.centerLeft,
    //     end: Alignment.centerRight,
    //     colors: colors.sublist(1),
    //     ).createShader(Rect.fromLTWH(0.0, 0.0, size.width, size.height)),
    //   ];
    // } else {
    //   grad = null;
    // }

    final double x = size.width / 2;
    final double y = size.height / 2;
    final double sizeFont = (size.shortestSide / 12.5);
    // (size.height/10)
    // (size.width)
    // (size.height)

    for (int i = 0, j = 0; i < 9 && j < 8; i++, j++) {
      final TextStyle textStyle1 = TextStyle(
        color: colors.elementAt(i + 1),
        fontFamily: vectorScaffold.fontFamilyName,
        fontSize: sizeFont,
        // shadows: [
        //     Shadow(
        //         blurRadius: 10.0,
        //         color: colors.elementAt(i+1),
        //         offset: Offset(-5.0, 5.0),
        //         ),
        // ],
        // foreground: Paint()..shader = grad[0],
        //   foreground: Paint()
        // ..color = colors.elementAt(i+1)
        // ..maskFilter =
        //         MaskFilter.blur(BlurStyle.normal, convertRadiusToSigma(40))
      );
      final TextSpan textSpan1 = TextSpan(
        text: String.fromCharCode(vectorScaffold.elements[i]),
        style: textStyle1,
      );
      final TextPainter textPainter1 = TextPainter(
        text: textSpan1,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );
      textPainter1.layout();
      final Offset offset1 = Offset(
        x - 10 * (textPainter1.width / 2),
        y - 10 * (textPainter1.height / 2),
      );
      // Offset(x-(textPainter1.width/2), y - (textPainter1.height / 2));
      //  Offset(0, 0);

      textPainter1.paint(canvas, offset1);
    }
  }

  static double convertRadiusToSigma(double radius) {
    return radius * 0.57735 + 0.5;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
