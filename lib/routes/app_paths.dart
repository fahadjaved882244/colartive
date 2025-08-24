// To Use for navigation in the app like context.go(AppPath.updateLocale)
// Full path from root to end-point
class AppPaths {
  AppPaths._();
  static const String home = '/';
  static const String search = 'search';
  static const String showcase = 'showcase';

  static const String canvasLive = 'canvas-live';
  static const String canvasLivePath = '/$canvasLive';

  static const String canvasFull = 'canvas-full';
  static const String canvasFullPath = '$canvasLivePath/$canvasFull';

  static const String canvasShare = 'canvas-share';
  static const String canvasSharePath = '$canvasFullPath/$canvasShare';

  static const String settings = 'settings';
  static const String settingsPath = '/$settings';

  static const String profile = 'profile';
  static const String profilePath = '$settingsPath/$profile';

  static const String login = 'login';
  static const String loginPath = '$settingsPath/$login';

  static const String signup = 'signup';
  static const String signupPath = '$loginPath/$signup';

  static const String resetPassword = 'reset-password';
  static const String resetPasswordPath = '$loginPath/$resetPassword';

  // static const String updateLocale =
  //     '${RouteNames.settings}/${RouteNames.updateLocale}';

  static const String updateProfile = 'update-profile';
  static const String updateProfilePath = '$profilePath/$updateProfile';

  static const String editName = 'edit-name';
  static const String editNamePath = '$updateProfilePath/$editName';

  static const String updateEmail = 'update-email';
  static const String updateEmailPath = '$updateProfilePath/$updateEmail';

  static const String changePassword = 'change-password';
  static const String changePasswordPath = '$updateProfilePath/$changePassword';
}

// To define the route names in AppRouter(GoRouter)
// these are just the end route of the Full-Path defined above in AppPaths
