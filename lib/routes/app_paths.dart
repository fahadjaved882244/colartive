class RouteNames {
  RouteNames._();
///////////////////////////////////////////////////////
///// Append '/' at the start of initial routes //////
/////////////////////////////////////////////////////
  static const String home = '/home';
  static const String search = '/search';
  static const String showcase = '/showcase';

  // Settings
  static const String settings = '/settings';

  static const String updateLocale = 'update-locale';

  static const String login = 'login';
  static const String signup = 'signup';
  static const String resetPassword = 'reset-password';

  static const String userProfile = 'user-profile';

  static const String updateProfile = 'update-profile';
  static const String editName = 'edit-name';
  static const String updateEmail = 'update-email';
  static const String changePassword = 'change-password';

  static const String canvasLive = '/canvas-live';
  static const String canvasFull = 'canvas-full';
}

// To Use for navigation in the app like context.go(AppPath.updateLocale)
// Full path from root to end-point
class AppPaths {
  AppPaths._();
  static const String home = RouteNames.home;
  static const String search = RouteNames.search;
  static const String showcase = RouteNames.showcase;
  static const String settings = RouteNames.settings;

  static const String canvasLive = "${RouteNames.canvasLive}/:templateId";

  static const String updateLocale =
      '${RouteNames.settings}/${RouteNames.updateLocale}';

  static const String login = '${RouteNames.settings}/${RouteNames.login}';
  static const String resetPassword =
      '${RouteNames.settings}/${RouteNames.login}/${RouteNames.resetPassword}';
  static const String signup =
      '${RouteNames.settings}/${RouteNames.login}/${RouteNames.signup}';

  static const String userProfile =
      '${RouteNames.settings}/${RouteNames.userProfile}';

  static const String updateProfile =
      '${RouteNames.settings}/${RouteNames.userProfile}/${RouteNames.updateProfile}';

  static const String editName =
      '${RouteNames.settings}/${RouteNames.userProfile}/${RouteNames.updateProfile}/${RouteNames.editName}';
  static const String updateEmail =
      '${RouteNames.settings}/${RouteNames.userProfile}/${RouteNames.updateProfile}/${RouteNames.updateEmail}';
  static const String changePassword =
      '${RouteNames.settings}/${RouteNames.userProfile}/${RouteNames.updateProfile}/${RouteNames.changePassword}';
}

// To define the route names in AppRouter(GoRouter)
// these are just the end route of the Full-Path defined above in AppPaths
