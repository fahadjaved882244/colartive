import 'package:colartive2/features/locale/data/utils/app_localizations.dart';
import 'package:colartive2/utils/controllers/theme_controller.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core_packages.dart';
import 'routes/app_router/app_router.dart';
import 'themes/app_theme.dart';
import 'features/locale/view/change_locale_controller.dart';
import 'utils/repositories/storage_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: const App(),
    ),
  );
}

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(themeControllerProvider);
    final themeMode = ref.read(themeControllerProvider.notifier).themeMode;
    final brightness = ref.read(themeControllerProvider.notifier).brightness;

    final locale = ref.watch(localeControllerProvider);

    final router = ref.watch(routerProvider);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
        statusBarBrightness:
            brightness == Brightness.dark ? Brightness.dark : Brightness.light,
        statusBarIconBrightness:
            brightness == Brightness.dark ? Brightness.light : Brightness.dark,
      ),
      child: MaterialApp.router(
        routerConfig: router,
        title: 'Colartive',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: themeMode,
        locale: locale,
        localizationsDelegates: const [
          AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.languages.map((e) => Locale(e)),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
