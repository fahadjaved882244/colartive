import 'package:colartive2/features/locale/model/app_language.dart';
import 'package:colartive2/features/locale/service/locale_service.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final localeControllerProvider =
    StateNotifierProvider<LocaleController, Locale>((ref) {
  final service = ref.watch(localeServiceProvider);
  return LocaleController(service);
});

class LocaleController extends StateNotifier<Locale> {
  final LocaleService _service;
  LocaleController(this._service) : super(const Locale('en')) {
    state = _service.getLocale();
  }

  void setLocale(Locale locale) {
    state = locale;
    _service.setLocale(locale);
  }

  List<AppLanguage> getSupportedLanguages() => _service.getSupportedLanguages();
}
