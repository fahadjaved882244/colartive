import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:colartive2/features/auth/views/auth_controller.dart';
import 'package:colartive2/features/auth/views/create_account/login/login_view.dart';
import 'package:colartive2/features/auth/views/create_account/reset_password/reset_password_view.dart';
import 'package:colartive2/features/auth/views/create_account/signup/signup_view.dart';
import 'package:colartive2/features/auth/views/update_account/change_password/change_password_view.dart';
import 'package:colartive2/features/auth/views/update_account/edit_name/edit_name_view.dart';
import 'package:colartive2/features/auth/views/update_account/update_email/update_email_view.dart';
import 'package:colartive2/features/auth/views/update_account/update_profile/update_profile_view.dart';
import 'package:colartive2/features/canvas/views/canvas_full/canvas_full_view.dart';
import 'package:colartive2/features/canvas/views/canvas_live/canvas_live_view.dart';
import 'package:colartive2/features/others/settings/settings_view.dart';
import 'package:colartive2/features/profile/views/profile_view.dart';
import 'package:colartive2/features/template/views/template_list_view.dart';
import 'package:colartive2/utils/components/widgets/error_view.dart';

import 'app_paths.dart';

// final shellNavigationKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>((ref) {
  final rootNavigationKey = GlobalKey<NavigatorState>();

  final isAuth = ValueNotifier<bool>(false);

  ref
    ..onDispose(isAuth.dispose)
    ..listen(authStateProvider, (_, next) {
      isAuth.value = next != null;
    });

  final router = GoRouter(
    navigatorKey: rootNavigationKey,
    refreshListenable: isAuth,
    initialLocation: AppPaths.home,
    errorBuilder: (context, state) =>
        ErrorView(message: state.error?.toString() ?? 'Error!'),
    routes: [
      GoRoute(
        path: AppPaths.home,
        builder: (BuildContext context, GoRouterState state) {
          return TemplateListView();
        },
        routes: [
          GoRoute(
            path: AppPaths.canvasLive,
            builder: (BuildContext context, GoRouterState state) {
              final templateId = state.uri.queryParameters['templateId'];
              if (templateId == null) {
                return const ErrorView(message: 'Template ID not found!');
              }
              return CanvasLiveView(templateId: templateId);
            },
            routes: [
              GoRoute(
                path: AppPaths.canvasFull,
                builder: (BuildContext context, GoRouterState state) {
                  final templateId = state.uri.queryParameters['templateId'];
                  if (templateId == null) {
                    return const ErrorView(message: 'Template ID not found!');
                  }
                  return CanvasFullView(templateId: templateId);
                },
              ),
            ],
          ),
          GoRoute(
            path: AppPaths.settings,
            builder: (BuildContext context, GoRouterState state) {
              return const SettingsView();
            },
            routes: [
              // GoRoute(
              //   path: RouteNames.updateLocale,
              //   builder: (BuildContext context, GoRouterState state) {
              //     return const ChangeLocaleView();
              //   },
              // ),
              GoRoute(
                path: AppPaths.profile,
                builder: (BuildContext context, GoRouterState state) {
                  return ProfileView();
                },
                redirect: (context, __) {
                  // Redirect to login if user is not authenticated
                  if (!isAuth.value) {
                    return AppPaths.loginPath;
                  }
                  return null;
                },
                routes: [
                  GoRoute(
                    path: AppPaths.updateProfile,
                    builder: (BuildContext context, GoRouterState state) {
                      return const UpdateProfileView();
                    },
                    routes: [
                      GoRoute(
                        path: AppPaths.editName,
                        builder: (BuildContext context, GoRouterState state) {
                          return const EditNameView();
                        },
                      ),
                      GoRoute(
                        path: AppPaths.updateEmail,
                        builder: (BuildContext context, GoRouterState state) {
                          return const UpdateEmailView();
                        },
                      ),
                      GoRoute(
                        path: AppPaths.changePassword,
                        builder: (BuildContext context, GoRouterState state) {
                          return const ChangePasswordView();
                        },
                      ),
                    ],
                  ),
                ],
              ),
              GoRoute(
                path: AppPaths.login,
                builder: (context, state) {
                  return const LoginView();
                },
                routes: [
                  GoRoute(
                    path: AppPaths.signup,
                    builder: (context, state) {
                      return const SignupView();
                    },
                  ),
                  GoRoute(
                    path: AppPaths.resetPassword,
                    builder: (BuildContext context, GoRouterState state) {
                      return const ResetPasswordView();
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );

  ref.onDispose(router.dispose);

  return router;
});
