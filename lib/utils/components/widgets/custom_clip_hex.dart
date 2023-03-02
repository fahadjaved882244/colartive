import 'package:flutter/material.dart';

class CustomClipHex extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width * 0.1, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width - (size.width * 0.1), size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
