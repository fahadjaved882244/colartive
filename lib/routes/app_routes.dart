import 'package:colartive2/modules/auth/components/forgotPassword/forgot_password_binding.dart';
import 'package:colartive2/modules/auth/components/forgotPassword/forgot_password_view.dart';
import 'package:colartive2/modules/auth/components/login/login_binding.dart';
import 'package:colartive2/modules/auth/components/login/login_view.dart';
import 'package:colartive2/modules/auth/components/signup/signup_binding.dart';
import 'package:colartive2/modules/auth/components/signup/signup_view.dart';
import 'package:colartive2/modules/navigation/navigation_binding.dart';
import 'package:colartive2/modules/navigation/navigation_view.dart';
import 'package:colartive2/modules/navigation/splash_screen/splash_screen_binding.dart';
import 'package:colartive2/modules/navigation/splash_screen/splash_screen_view.dart';
import 'package:colartive2/routes/route_names.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final routes = <GetPage>[
    //Basic
    GetPage(
      name: RouteNames.navigationView,
      page: () => const NavigationView(),
      binding: NavigationBinding(),
    ),
    //Auth
    GetPage(
      name: RouteNames.splashScreenView,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: RouteNames.loginView,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RouteNames.signupView,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: RouteNames.forgotPasswordView,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),

    //Settings
    // GetPage(
    //   name: RouteNames.profileView,
    //   page: () => const ProfileView(),
    // ),
    // GetPage(
    //   name: RouteNames.settingsView,
    //   page: () => const SettingsView(),
    // ),
    // GetPage(
    //   name: RouteNames.editAccountView,
    //   page: () => const EditUserView(),
    //   binding: EditUserBinding(),
    // ),
    // GetPage(
    //   name: RouteNames.updateEmailView,
    //   page: () => const UpdateEmailView(),
    //   binding: UpdateEmailBinding(),
    // ),
    // GetPage(
    //   name: RouteNames.changePasswordView,
    //   page: () => const ChangePasswordView(),
    //   binding: ChangePasswordBinding(),
    // ),
  ];
}
