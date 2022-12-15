import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {
  static final _box = GetStorage();
  static const _key = 'isDarkMode';

  /// Get isDarkMode info from local storage and return ThemeMode
  static ThemeMode get theme => isDarkMode ? ThemeMode.dark : ThemeMode.light;

  /// Load isDArkMode from local storage and if it's empty, returns false (that means default theme is light)
  static bool get isDarkMode => _box.read(_key) ?? false;

  /// Save isDarkMode to local storage
  static _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);

  /// Switch theme and save to local storage
  static void switchTheme() {
    Get.changeThemeMode(isDarkMode ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!isDarkMode);
  }
}

class ThemeController extends GetxController {
  final Rx<bool> _isDarkMode = ThemeService.isDarkMode.obs;
  bool get isDarkMode => _isDarkMode.value;
  set isDarkMode(bool value) {
    _isDarkMode.value = value;
    ThemeService.switchTheme();
  }
}
