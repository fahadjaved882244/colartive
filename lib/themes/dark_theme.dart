import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/core/app_colors.dart';
import '../utils/core/app_sizes.dart';

class DarkAppTheme {
  DarkAppTheme._();

  static final themeData = ThemeData.dark(useMaterial3: true).copyWith(
    colorScheme: _colorScheme,
    textTheme: _textTheme,
    scaffoldBackgroundColor: _colorScheme.surface,
    tabBarTheme: _tabBarTheme,
    dividerTheme: _dividerTheme,
    drawerTheme: _drawerTheme,
    listTileTheme: _listTileTheme,
    switchTheme: _switchTheme,
    radioTheme: _radioTheme,
    checkboxTheme: _checkboxTheme,
    inputDecorationTheme: _inputDecorationTheme,
    useMaterial3: true,
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

  static const _dividerTheme = DividerThemeData(
    color: Color(0xff444746),
    thickness: 1,
    space: 16,
  );

  static final _drawerTheme = DrawerThemeData(
    elevation: 5,
    backgroundColor: _colorScheme.surface,
    scrimColor: _colorScheme.inverseSurface.withOpacity(0.4),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(16),
        bottomRight: Radius.circular(16),
      ),
    ),
  );

  /////////// TabBar Theme //////////////
  static final _tabBarTheme = TabBarTheme(
    labelColor: _colorScheme.primary,
    unselectedLabelColor: _colorScheme.onSurfaceVariant,
    indicatorSize: TabBarIndicatorSize.label,
  );

  static final _listTileTheme = ListTileThemeData(
    contentPadding:
        const EdgeInsets.only(left: 16, right: 24, top: 8, bottom: 8),
    minVerticalPadding: 0,
    minLeadingWidth: 24,
    horizontalTitleGap: 16,
    tileColor: AppColors.transparent,
    selectedTileColor: _colorScheme.surface,
    selectedColor: _colorScheme.onSurfaceVariant,
    iconColor: _colorScheme.onSurfaceVariant,
  );

  /////////// Switch Theme //////////////
  static final _switchTheme = SwitchThemeData(
    thumbColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return _colorScheme.primary;
      } else if (states.contains(MaterialState.disabled)) {
        return AppColors.lightGray;
      } else {
        return AppColors.white;
      }
    }),
    trackColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return _colorScheme.primaryContainer;
      } else if (states.contains(MaterialState.disabled)) {
        return AppColors.lightGray;
      } else {
        return AppColors.darkGray;
      }
    }),
  );

  /////////// Radio Theme //////////////
  static final _radioTheme = RadioThemeData(
    fillColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return _colorScheme.primary;
      } else if (states.contains(MaterialState.disabled)) {
        return AppColors.lightGray;
      } else {
        return AppColors.darkGray;
      }
    }),
  );

  /////////// Radio Theme //////////////
  static final _checkboxTheme = CheckboxThemeData(
    fillColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return _colorScheme.primary;
      } else if (states.contains(MaterialState.disabled)) {
        return AppColors.lightGray;
      } else {
        return AppColors.darkGray;
      }
    }),
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
    // filled: true,
    // fillColor: _colorScheme.surfaceVariant,
    // errorMaxLines: 3,
    // contentPadding: const EdgeInsets.all(AppSizes.smallPadding),
    // labelStyle:
    //     _textTheme.labelLarge!.copyWith(color: _colorScheme.onSurfaceVariant),
    // hintStyle:
    //     _textTheme.labelLarge!.copyWith(color: _colorScheme.onSurfaceVariant),
    // errorStyle: _textTheme.labelSmall!.copyWith(color: _colorScheme.error),
    // helperStyle: _textTheme.labelSmall,
    // counterStyle: _textTheme.labelSmall,
    // border: const OutlineInputBorder(
    //   borderRadius: BorderRadius.all(Radius.circular(AppSizes.textFieldRadius)),
    //   borderSide: BorderSide.none,
    // ),
    // disabledBorder: const OutlineInputBorder(
    //   borderRadius: BorderRadius.all(Radius.circular(AppSizes.textFieldRadius)),
    //   borderSide: BorderSide.none,
    // ),
    // errorBorder: OutlineInputBorder(
    //   borderRadius:
    //       const BorderRadius.all(Radius.circular(AppSizes.textFieldRadius)),
    //   borderSide: BorderSide(color: _colorScheme.error),
    // ),
    // focusedErrorBorder: OutlineInputBorder(
    //   borderRadius:
    //       const BorderRadius.all(Radius.circular(AppSizes.textFieldRadius)),
    //   borderSide: BorderSide(color: _colorScheme.error),
    // ),
  );
}
