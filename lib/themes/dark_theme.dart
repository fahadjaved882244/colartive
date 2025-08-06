import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/core/app_colors.dart';
import '../utils/core/app_sizes.dart';

class DarkAppTheme {
  DarkAppTheme._();

  static final themeData = ThemeData.dark(useMaterial3: true).copyWith(
    colorScheme: _colorScheme,
    textTheme: _textTheme,
    inputDecorationTheme: _inputDecorationTheme,
  );

  static final _colorScheme = ColorScheme.fromSeed(
    seedColor: AppColors.primary,
    brightness: Brightness.dark,
    // surfaceVariant: const Color(0xff252525),
  );

  // static final _overlayColor = ElevationOverlay.colorWithOverlay(
  //     _colorScheme.surface, _colorScheme.onSurface, 5);

  static final _textTheme = GoogleFonts.robotoSerifTextTheme().apply(
    bodyColor: _colorScheme.onSurface,
    displayColor: _colorScheme.onSurface,
    fontFamily: 'SummerPixel',
  );

  static final _inputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    contentPadding: const EdgeInsets.all(Paddings.sm),
    iconColor: _colorScheme.onSurfaceVariant,
    labelStyle:
        _textTheme.bodyLarge!.copyWith(color: _colorScheme.onSurfaceVariant),
    hintStyle:
        _textTheme.bodyLarge!.copyWith(color: _colorScheme.onSurfaceVariant),
    errorStyle: _textTheme.bodySmall!.copyWith(color: _colorScheme.error),
    helperStyle: _textTheme.bodySmall,
    counterStyle: _textTheme.bodySmall,
    border: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(Corners.tf)),
      borderSide: BorderSide(color: _colorScheme.outline),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(Corners.tf)),
      borderSide: BorderSide(color: _colorScheme.outline),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(Corners.tf)),
      borderSide: BorderSide(color: _colorScheme.outline),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(Corners.tf)),
      borderSide: BorderSide(color: _colorScheme.primary, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(Corners.tf)),
      borderSide: BorderSide(color: _colorScheme.error),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(Corners.tf)),
      borderSide: BorderSide(color: _colorScheme.error),
    ),
  );
}
