import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_sizes.dart';
import 'app_theme.dart';

class LightAppTheme {
  static final themeData = ThemeData.light(useMaterial3: true).copyWith(
    colorScheme: _colorScheme,
    textTheme: _textTheme,
    scaffoldBackgroundColor: _colorScheme.surface,
    // appBarTheme: _appBarTheme,
    tabBarTheme: _tabBarTheme,
    dividerTheme: _dividerTheme,
    drawerTheme: _drawerTheme,
    cardTheme: _cardTheme,
    floatingActionButtonTheme: _fabTheme,
    listTileTheme: _listTileTheme,
    switchTheme: _switchTheme,
    radioTheme: _radioTheme,
    checkboxTheme: _checkboxTheme,
    inputDecorationTheme: _inputDecorationTheme,
    useMaterial3: true,
  );

  /////////// Color Theme //////////////
  static final _colorScheme = ColorScheme.fromSeed(
    seedColor: AppColors.primary,
    brightness: Brightness.light,
  );

  // static final _overlayColor = ElevationOverlay.colorWithOverlay(
  //     _colorScheme.surface, _colorScheme.onSurface, 3);

  /////////// Text Theme //////////////
  static final _textTheme = GoogleFonts.latoTextTheme().apply(
    bodyColor: _colorScheme.onSurface,
    displayColor: _colorScheme.onSurface,
  );

  /////////// AppBar Theme //////////////
  // static final _appBarTheme = AppBarTheme(
  //   systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
  //     statusBarColor: AppColors.transparent,
  //   ),
  //   elevation: 0,
  //   color: _colorScheme.surface,
  //   centerTitle: true,
  //   iconTheme: const IconThemeData(color: AppColors.black),
  //   titleTextStyle: _textTheme.titleLarge,
  //   titleSpacing: AppSizes.smallPadding,
  // );

  /////////// FAB Theme //////////////
  static final _fabTheme = FloatingActionButtonThemeData(
    elevation: 3,
    backgroundColor: _colorScheme.tertiaryContainer,
    foregroundColor: _colorScheme.onTertiaryContainer,
    extendedTextStyle: _textTheme.button,
    extendedIconLabelSpacing: AppSizes.exSmallPadding,
    extendedPadding: const EdgeInsets.only(
      left: AppSizes.smallPadding,
      right: AppSizes.smallPadding + 4,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSizes.fabRadius),
    ),
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

  /////////// List Tile Theme //////////////
  static final _listTileTheme = ListTileThemeData(
    contentPadding:
        const EdgeInsets.only(left: 16, right: 24, top: 8, bottom: 8),
    minVerticalPadding: 0,
    minLeadingWidth: 24,
    horizontalTitleGap: AppSizes.smallPadding,
    tileColor: AppColors.transparent,
    selectedTileColor: _colorScheme.surface,
    selectedColor: _colorScheme.onSurfaceVariant,
    iconColor: _colorScheme.onSurfaceVariant,
  );

  /////////// Card Theme //////////////
  static final _cardTheme = CardTheme(
    elevation: 0,
    color: _colorScheme.surfaceVariant,
    margin: EdgeInsets.zero,
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSizes.cardRadius),
    ),
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
        return _colorScheme.secondary;
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

  /////////// Input Decoration Theme //////////////
  static final _inputDecorationTheme = InputDecorationTheme(
    // filled: true,
    // fillColor: _colorScheme.surfaceVariant,
    errorMaxLines: 2,
    contentPadding: const EdgeInsets.all(AppSizes.smallPadding),
    iconColor: _colorScheme.onSurfaceVariant,
    labelStyle:
        _textTheme.bodyLarge!.copyWith(color: _colorScheme.onSurfaceVariant),
    hintStyle:
        _textTheme.bodyLarge!.copyWith(color: _colorScheme.onSurfaceVariant),
    errorStyle: _textTheme.bodySmall!.copyWith(color: _colorScheme.error),
    helperStyle: _textTheme.bodySmall,
    counterStyle: _textTheme.bodySmall,
    border: OutlineInputBorder(
      borderRadius:
          const BorderRadius.all(Radius.circular(AppSizes.textFieldRadius)),
      borderSide: BorderSide(color: _colorScheme.outline),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius:
          const BorderRadius.all(Radius.circular(AppSizes.textFieldRadius)),
      borderSide: BorderSide(color: _colorScheme.outline),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius:
          const BorderRadius.all(Radius.circular(AppSizes.textFieldRadius)),
      borderSide: BorderSide(color: _colorScheme.outline),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius:
          const BorderRadius.all(Radius.circular(AppSizes.textFieldRadius)),
      borderSide: BorderSide(color: _colorScheme.primary, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius:
          const BorderRadius.all(Radius.circular(AppSizes.textFieldRadius)),
      borderSide: BorderSide(color: _colorScheme.error),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius:
          const BorderRadius.all(Radius.circular(AppSizes.textFieldRadius)),
      borderSide: BorderSide(color: _colorScheme.error),
    ),
  );
}
