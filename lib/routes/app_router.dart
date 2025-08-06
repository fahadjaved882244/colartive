import 'package:colartive2/features/canvas_full/canvas_full_view.dart';
import 'package:colartive2/features/canvas_live/views/canvas_live_view.dart';
import 'package:colartive2/features/template/views/template_list_view.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import 'package:colartive2/features/locale/view/change_locale_view.dart';
import 'package:colartive2/features/others/navigation/navigation_view.dart';
import 'package:colartive2/features/profile/views/profile_view.dart';
import 'package:colartive2/utils/components/widgets/error_view.dart';

import '../features/auth/views/create_account/login/login_view.dart';
import '../features/auth/views/create_account/reset_password/reset_password_view.dart';
import '../features/auth/views/create_account/signup/signup_view.dart';
import '../features/auth/views/update_account/change_password/change_password_view.dart';
import '../features/auth/views/update_account/edit_name/edit_name_view.dart';
import '../features/auth/views/update_account/update_email/update_email_view.dart';
import '../features/auth/views/update_account/update_profile/update_profile_view.dart';
import '../features/others/settings/settings_view.dart';
import 'app_paths.dart';

class HomeView extends StatelessWidget {
  final String path;

  const HomeView({super.key, required this.path});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(path),
    );
  }
}

final rootNavigationKey = GlobalKey<NavigatorState>();
final shellNavigationKey = GlobalKey<NavigatorState>();

class AppRouter {
  static final router = GoRouter(
    navigatorKey: rootNavigationKey,
    initialLocation: RouteNames.home,
    errorBuilder: (context, state) =>
        ErrorView(message: state.path ?? 'Error!'),
    routes: [
      GoRoute(
        name: RouteNames.canvasLive,
        path: AppPaths.canvasLive,
        builder: (BuildContext context, GoRouterState state) {
          final templateId = state.pathParameters['templateId'];
          if (templateId == null) {
            return const ErrorView(message: 'Template ID not found!');
          }
          return CanvasLiveView(templateId: templateId);
        },
        routes: [
          GoRoute(
            name: RouteNames.canvasFull,
            path: RouteNames.canvasFull,
            builder: (BuildContext context, GoRouterState state) {
              final templateId = state.pathParameters['templateId'];
              if (templateId == null) {
                return const ErrorView(message: 'Template ID not found!');
              }
              return CanvasFullView(templateId: templateId);
            },
          ),
        ],
      ),
      ShellRoute(
        navigatorKey: shellNavigationKey,
        builder: (context, state, child) {
          return NavigationView(child: child);
        },
        routes: <RouteBase>[
          /// The first screen to display in the bottom navigation bar.
          GoRoute(
            name: RouteNames.home,
            path: RouteNames.home,
            builder: (BuildContext context, GoRouterState state) {
              return TemplateListView();
            },
            routes: [],
          ),
          GoRoute(
            path: RouteNames.search,
            builder: (BuildContext context, GoRouterState state) {
              return HomeView(path: state.uri.toString());
            },
          ),
          GoRoute(
            path: RouteNames.showcase,
            builder: (BuildContext context, GoRouterState state) {
              return HomeView(path: state.uri.toString());
            },
          ),
          GoRoute(
            path: RouteNames.settings,
            builder: (BuildContext context, GoRouterState state) {
              return const SettingsView();
            },
            routes: [
              GoRoute(
                path: RouteNames.updateLocale,
                builder: (BuildContext context, GoRouterState state) {
                  return const ChangeLocaleView();
                },
              ),
              GoRoute(
                path: RouteNames.login,
                builder: (context, state) {
                  return const LoginView();
                },
                routes: [
                  GoRoute(
                    path: RouteNames.signup,
                    builder: (context, state) {
                      return const SignupView();
                    },
                  ),
                  GoRoute(
                    path: RouteNames.resetPassword,
                    builder: (BuildContext context, GoRouterState state) {
                      return const ResetPasswordView();
                    },
                  ),
                ],
              ),
              GoRoute(
                path: RouteNames.userProfile,
                builder: (BuildContext context, GoRouterState state) {
                  return ProfileView();
                },
                routes: [
                  GoRoute(
                    path: RouteNames.updateProfile,
                    builder: (BuildContext context, GoRouterState state) {
                      return const UpdateProfileView();
                    },
                    routes: [
                      GoRoute(
                        path: RouteNames.editName,
                        builder: (BuildContext context, GoRouterState state) {
                          return const EditNameView();
                        },
                      ),
                      GoRoute(
                        path: RouteNames.updateEmail,
                        builder: (BuildContext context, GoRouterState state) {
                          return const UpdateEmailView();
                        },
                      ),
                      GoRoute(
                        path: RouteNames.changePassword,
                        builder: (BuildContext context, GoRouterState state) {
                          return const ChangePasswordView();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
