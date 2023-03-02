import 'dart:ui';

import '../../model/app_language.dart';

class LocaleRepository {
  static const _languages = {
    'en': AppLanguage(name: 'English', locale: Locale('en')),
    'de': AppLanguage(name: 'Deutsch', locale: Locale('de')),
    'fr': AppLanguage(name: 'Français', locale: Locale('fr')),
    'ar': AppLanguage(name: 'العربية', locale: Locale('ar')),
    'es': AppLanguage(name: 'Español', locale: Locale('es')),
    'it': AppLanguage(name: 'Italiano', locale: Locale('it')),
  };

  List<AppLanguage> get appLanguages => _languages.values.toList();
}
