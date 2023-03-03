// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<GoRoute> get $appRoutes => [
      $homeRoute,
      $searchRoute,
      $showCaseRoute,
      $settingsRoute,
    ];

GoRoute get $homeRoute => GoRouteData.$route(
      path: '/home',
      factory: $HomeRouteExtension._fromState,
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/home',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

GoRoute get $searchRoute => GoRouteData.$route(
      path: '/search',
      factory: $SearchRouteExtension._fromState,
    );

extension $SearchRouteExtension on SearchRoute {
  static SearchRoute _fromState(GoRouterState state) => const SearchRoute();

  String get location => GoRouteData.$location(
        '/search',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

GoRoute get $showCaseRoute => GoRouteData.$route(
      path: '/showcase',
      factory: $ShowCaseRouteExtension._fromState,
    );

extension $ShowCaseRouteExtension on ShowCaseRoute {
  static ShowCaseRoute _fromState(GoRouterState state) => const ShowCaseRoute();

  String get location => GoRouteData.$location(
        '/showcase',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

GoRoute get $settingsRoute => GoRouteData.$route(
      path: '/settings',
      factory: $SettingsRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'change-locale',
          factory: $ChangeLocaleRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'login',
          factory: $LoginRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'signup',
              factory: $SignupRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'reset-password',
              factory: $ResetPasswordRouteExtension._fromState,
            ),
          ],
        ),
        GoRouteData.$route(
          path: 'profile/:id',
          factory: $ProfileRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'update-profile',
              factory: $UpdateProfileRouteExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'edit-name',
                  factory: $EditNameRouteExtension._fromState,
                ),
                GoRouteData.$route(
                  path: 'update-email',
                  factory: $UpdateEmailRouteExtension._fromState,
                ),
                GoRouteData.$route(
                  path: 'change-password',
                  factory: $ChangePasswordRouteExtension._fromState,
                ),
              ],
            ),
          ],
        ),
      ],
    );

extension $SettingsRouteExtension on SettingsRoute {
  static SettingsRoute _fromState(GoRouterState state) => const SettingsRoute();

  String get location => GoRouteData.$location(
        '/settings',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $ChangeLocaleRouteExtension on ChangeLocaleRoute {
  static ChangeLocaleRoute _fromState(GoRouterState state) =>
      const ChangeLocaleRoute();

  String get location => GoRouteData.$location(
        '/settings/change-locale',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $LoginRouteExtension on LoginRoute {
  static LoginRoute _fromState(GoRouterState state) => const LoginRoute();

  String get location => GoRouteData.$location(
        '/settings/login',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $SignupRouteExtension on SignupRoute {
  static SignupRoute _fromState(GoRouterState state) => const SignupRoute();

  String get location => GoRouteData.$location(
        '/settings/login/signup',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $ResetPasswordRouteExtension on ResetPasswordRoute {
  static ResetPasswordRoute _fromState(GoRouterState state) =>
      const ResetPasswordRoute();

  String get location => GoRouteData.$location(
        '/settings/login/reset-password',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $ProfileRouteExtension on ProfileRoute {
  static ProfileRoute _fromState(GoRouterState state) => ProfileRoute(
        id: state.params['id']!,
      );

  String get location => GoRouteData.$location(
        '/settings/profile/${Uri.encodeComponent(id)}',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $UpdateProfileRouteExtension on UpdateProfileRoute {
  static UpdateProfileRoute _fromState(GoRouterState state) =>
      UpdateProfileRoute(
        id: state.params['id']!,
      );

  String get location => GoRouteData.$location(
        '/settings/profile/${Uri.encodeComponent(id)}/update-profile',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $EditNameRouteExtension on EditNameRoute {
  static EditNameRoute _fromState(GoRouterState state) => EditNameRoute(
        id: state.params['id']!,
      );

  String get location => GoRouteData.$location(
        '/settings/profile/${Uri.encodeComponent(id)}/update-profile/edit-name',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $UpdateEmailRouteExtension on UpdateEmailRoute {
  static UpdateEmailRoute _fromState(GoRouterState state) => UpdateEmailRoute(
        id: state.params['id']!,
      );

  String get location => GoRouteData.$location(
        '/settings/profile/${Uri.encodeComponent(id)}/update-profile/update-email',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $ChangePasswordRouteExtension on ChangePasswordRoute {
  static ChangePasswordRoute _fromState(GoRouterState state) =>
      ChangePasswordRoute(
        id: state.params['id']!,
      );

  String get location => GoRouteData.$location(
        '/settings/profile/${Uri.encodeComponent(id)}/update-profile/change-password',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}
