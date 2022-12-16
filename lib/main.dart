import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'routes/app_routes.dart';
import 'routes/route_names.dart';
import 'services/basic/initial_binding.dart';
import 'services/basic/theme_service.dart';
import 'themes/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await GetStorage.init();

  runApp(App());
}

class App extends StatelessWidget {
  final controller = Get.put(ThemeController());

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: AppColors.transparent,
          statusBarBrightness:
              controller.isDarkMode ? Brightness.dark : Brightness.light,
          statusBarIconBrightness:
              controller.isDarkMode ? Brightness.light : Brightness.dark,
        ),
        child: GetMaterialApp(
          title: 'Colartive',
          initialRoute: RouteNames.navigationView,
          initialBinding: InitialBinding(),
          getPages: AppRoutes.routes,
          defaultTransition: Transition.fade,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeService.theme,
        ),
      ),
    );
  }
}
