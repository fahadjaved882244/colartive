import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import '../../../../utils/core/app_strings.dart';

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);

  ////////////////////////////////////////////////////////
  /////////// Map of [AppStrings] in all locales /////////
  ////////////////////////////////////////////////////////
  static const _localizedValues = AppStrings.localizedValues;

  static AppLocalizations of(BuildContext context) =>
      Localizations.of<AppLocalizations>(context, AppLocalizations)!;

  static List<String> get languages => _localizedValues.keys.toList();

  String tr(String key) {
    return _localizedValues[locale.languageCode]![key] ?? key;
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      AppLocalizations.languages.contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of DemoLocalizations.
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => this != old;
}
