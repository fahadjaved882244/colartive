import 'dart:ui';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../main.dart';

final localStorageRepositoryProvider = Provider<LocalStorageRepository>((ref) {
  final sharedPrefs = ref.read(sharedPreferencesProvider);
  return LocalStorageRepository(sharedPrefs);
});

class LocalStorageRepository {
  final SharedPreferences _box;
  LocalStorageRepository(this._box);

  static const _darkModeKey = 'isDarkMode';
  static const _forceModeKey = 'forceMode';

  /// Load isDarkMode from local storage and if it's empty, returns true (that means default theme is dark)
  bool get darkModeFlag => _box.getBool(_darkModeKey) ?? true;
  bool get forceModeFlag => _box.getBool(_forceModeKey) ?? false;

  /// Save to local storage
  void saveDarkModeFlag(bool flag) async =>
      await _box.setBool(_darkModeKey, flag);

  void saveForceModeFlag(bool flag) async =>
      await _box.setBool(_forceModeKey, flag);

  //////////////////////////
  ///////// Locale /////////
  /////////////////////////
  static const _languageKey = 'locale_language';
  static const _countryKey = 'locale_country';

  Locale get locale => Locale(
        _box.getString(_languageKey) ?? 'en',
        _box.getString(_countryKey),
      );

  /// Save locale to local storage
  void saveLanguageCode(Locale locale) {
    _box.setString(_languageKey, locale.languageCode);
    if (locale.countryCode != null) {
      _box.setString(_countryKey, locale.countryCode!);
    }
  }
}
