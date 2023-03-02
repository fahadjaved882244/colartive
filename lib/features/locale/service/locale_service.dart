import 'package:colartive2/core_packages.dart';
import 'package:colartive2/features/locale/data/repositories/locale_repository.dart';
import 'package:colartive2/features/locale/model/app_language.dart';
import 'package:colartive2/utils/repositories/storage_repository.dart';

final localeRepoProvider = Provider<LocaleRepository>((ref) {
  return LocaleRepository();
});

final localeServiceProvider = Provider<LocaleService>((ref) {
  final storage = ref.watch(localStorageRepositoryProvider);
  final localeRepo = ref.watch(localeRepoProvider);
  return LocaleService(storage, localeRepo);
});

class LocaleService {
  final LocalStorageRepository _localStorage;
  final LocaleRepository _localeRepository;

  LocaleService(this._localStorage, this._localeRepository);

  List<AppLanguage> getSupportedLanguages() {
    return _localeRepository.appLanguages;
  }

  Locale getLocale() => _localStorage.locale;

  void setLocale(Locale locale) {
    _localStorage.saveLanguageCode(locale);
  }
}
