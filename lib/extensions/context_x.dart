import 'package:flutter/material.dart';

extension ContextX on BuildContext {
  TextTheme get textTheme {
    return Theme.of(this).textTheme;
  }

  ColorScheme get colors {
    return Theme.of(this).colorScheme;
  }

  double get width {
    return MediaQuery.of(this).size.width;
  }

  double get height {
    return MediaQuery.of(this).size.height;
  }
}
