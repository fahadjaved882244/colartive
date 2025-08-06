import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/core/app_colors.dart';
import '../utils/core/app_sizes.dart';

class LightAppTheme {
  LightAppTheme._();

  static final themeData = ThemeData.light(useMaterial3: true).copyWith(
    colorScheme: _colorScheme,
    textTheme: _textTheme,
    inputDecorationTheme: _inputDecorationTheme,
  );

  /////////// Color Theme //////////////
  static final _colorScheme = ColorScheme.fromSeed(
    seedColor: AppColors.primary,
    brightness: Brightness.light,
    // surface: const Color(0xfff2f2f2),
    // surfaceVariant: const Color(0xffFAFAFA),
  );

  static const _cardTheme = CardThemeData(
    elevation: 0,
    margin: EdgeInsets.all(0),
  );

  // static final _overlayColor = ElevationOverlay.colorWithOverlay(
  //     _colorScheme.surface, _colorScheme.onSurface, 3);

  /////////// Text Theme //////////////
  static final _textTheme = GoogleFonts.robotoSerifTextTheme().apply(
    bodyColor: _colorScheme.onSurface,
    displayColor: _colorScheme.onSurface,
    fontFamily: 'SummerPixel',
  );

  /////////// Divider Theme //////////////
  static const _dividerTheme = DividerThemeData(
    color: Color(0xffC4C7C5),
    thickness: 0.5,
    space: 16,
  );

  /////////// Drawer Theme //////////////
  static final _drawerTheme = DrawerThemeData(
    elevation: 5,
    backgroundColor: _colorScheme.surface,
    scrimColor: _colorScheme.inverseSurface.withValues(alpha: 0.4),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(16),
        bottomRight: Radius.circular(16),
      ),
    ),
  );

  /////////// TabBar Theme //////////////
  static final _tabBarTheme = TabBarThemeData(
    labelColor: _colorScheme.primary,
    unselectedLabelColor: _colorScheme.onSurfaceVariant,
    indicatorSize: TabBarIndicatorSize.label,
  );

  /////////// List Tile Theme //////////////
  static final _listTileTheme = ListTileThemeData(
    contentPadding:
        const EdgeInsets.only(left: 16, right: 24, top: 8, bottom: 8),
    minVerticalPadding: 0,
    minLeadingWidth: 24,
    horizontalTitleGap: Paddings.sm,
    tileColor: AppColors.transparent,
    selectedTileColor: _colorScheme.surface,
    selectedColor: _colorScheme.onSurfaceVariant,
    iconColor: _colorScheme.onSurfaceVariant,
  );

  /////////// Input Decoration Theme //////////////
  static final _inputDecorationTheme = InputDecorationTheme(
    // filled: true,
    // fillColor: _colorScheme.surfaceVariant,
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
