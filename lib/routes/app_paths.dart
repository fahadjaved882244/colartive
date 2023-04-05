// To define the route names in AppRouter(GoRouter)
// these are just the end route of the Full-Path defined above in AppPaths

class RouteNames {
  RouteNames._();
///////////////////////////////////////////////////////
///// Append '/' at the start of initial routes //////
/////////////////////////////////////////////////////

  static const String login = 'login';
  static const String signup = 'signup';
  static const String resetPassword = 'reset-password';

  static const String contributorProfile = 'contributor';
  static const String artistProfile = 'artist';

  static const String home = 'home';
  static const String search = 'search';
  static const String showcase = 'showcase';

  // Settings
  static const String settings = 'settings';
  static const String changeLocale = 'change-locale';

  static const String userProfile = 'user';
  static const String updateProfile = 'update-profile';
  static const String editName = 'edit-name';
  static const String updateEmail = 'update-email';
  static const String changePassword = 'change-password';
}

// To Use for navigation in the app like context.go(AppPath.updateLocale)
// Full path from root to end-point
class AppPaths {
  AppPaths._();
  static const String login = "/${RouteNames.login}";
  static const String signup = "/${RouteNames.signup}";
  static const String resetPassword = "/${RouteNames.resetPassword}";

  static const String contributor = '/${RouteNames.contributorProfile}/:userId';
  static const String designer = '/${RouteNames.artistProfile}/:userId';

  static const String home = "/${RouteNames.home}";
  static const String search = "/${RouteNames.search}";
  static const String showcase = "/${RouteNames.showcase}";
  static const String settings = "/${RouteNames.settings}";

  static const String changeLocale = RouteNames.changeLocale;

  static const String userProfile = RouteNames.userProfile;

  static const String updateProfile = RouteNames.updateProfile;

  static const String editName = RouteNames.editName;
  static const String updateEmail = RouteNames.updateEmail;
  static const String changePassword = RouteNames.changePassword;
}
