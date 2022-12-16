import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {
  static final _box = GetStorage();
  static const _darkModeKey = 'isDarkMode';
  static const _forceModeKey = 'forceMode';

  /// Get isDarkMode info from local storage and return ThemeMode
  static ThemeMode get theme => isDarkMode ? ThemeMode.dark : ThemeMode.light;

  /// Load isDarkMode from local storage and if it's empty, returns false (that means default theme is light)
  static bool get isDarkMode => _box.read(_darkModeKey) ?? false;
  static bool get forceMode => _box.read(_forceModeKey) ?? false;

  /// Save isDarkMode to local storage
  static _saveThemeToBox(bool darkMode) => _box.write(_darkModeKey, darkMode);
  static _saveForceThemeToBox(bool mode) => _box.write(_forceModeKey, mode);

  /// Switch theme and save to local storage
  static void switchTheme() {
    Get.changeThemeMode(isDarkMode ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!isDarkMode);
  }

  static void switchForceTheme() {
    Get.changeThemeMode(ThemeMode.system);
    _saveForceThemeToBox(!forceMode);
  }

  static void resetTheme() {
    Get.changeThemeMode(isDarkMode ? ThemeMode.dark : ThemeMode.light);
  }
}

class ThemeController extends GetxController {
  final Rx<bool> _isDarkMode = ThemeService.isDarkMode.obs;
  bool get isDarkMode => _isDarkMode.value;
  set isDarkMode(bool value) {
    _isDarkMode.value = value;
    ThemeService.switchTheme();
  }

  final Rx<bool> _forceMode = ThemeService.forceMode.obs;
  bool get forceMode => _forceMode.value;
  set forceMode(bool value) {
    _forceMode.value = value;
    ThemeService.switchForceTheme();
    if (!value) ThemeService.resetTheme();
  }
}
