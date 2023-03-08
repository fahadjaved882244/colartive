import 'package:colartive2/core_packages.dart';
import 'package:colartive2/features/auth/views/auth_controller.dart';
import 'package:colartive2/features/vector_art/views/home_view.dart';

import '../../app_keys.dart';
import '../../features/auth/views/create_account/login/login_view.dart';
import '../../features/auth/views/create_account/reset_password/reset_password_view.dart';
import '../../features/auth/views/create_account/signup/signup_view.dart';
import '../../features/auth/views/update_account/change_password/change_password_view.dart';
import '../../features/auth/views/update_account/edit_name/edit_name_view.dart';
import '../../features/auth/views/update_account/update_email/update_email_view.dart';
import '../../features/auth/views/update_account/update_profile/update_profile_view.dart';
import '../../features/locale/view/change_locale_view.dart';
import '../../features/others/navigation/navigation_view.dart';
import '../../features/others/settings/settings_view.dart';
import '../../features/profile/views/profile_view.dart';
import '../../utils/components/widgets/error_view.dart';
import 'app_router.dart';

final routerNotifierProvider =
    AutoDisposeAsyncNotifierProvider<RouterNotifier, void>(() {
  return RouterNotifier();
});

class RouterNotifier extends AutoDisposeAsyncNotifier<void>
    implements Listenable {
  VoidCallback? routerListener;
  bool isAuth = false;

  @override
  Future<void> build() async {
    // One could watch more providers and write logic accordingly

    isAuth = await ref.watch(
      authStateProvider.selectAsync((data) => data != null),
    );

    ref.listenSelf((_, __) {
      // One could write more conditional logic for when to call redirection
      if (state.isLoading) return;
      routerListener?.call();
    });
  }

  @override
  void addListener(VoidCallback listener) {
    routerListener = listener;
  }

  @override
  void removeListener(VoidCallback listener) {
    routerListener = null;
  }

  List<RouteBase> get routes => [
        GoRoute(
          name: RouteNames.login,
          path: AppPaths.login,
          parentNavigatorKey: AppKeys.rootNavigatorKey,
          builder: (context, state) {
            return const LoginView();
          },
        ),
        GoRoute(
          name: RouteNames.signup,
          path: AppPaths.signup,
          parentNavigatorKey: AppKeys.rootNavigatorKey,
          builder: (context, state) {
            return const SignupView();
          },
        ),
        GoRoute(
          name: RouteNames.resetPassword,
          path: AppPaths.resetPassword,
          parentNavigatorKey: AppKeys.rootNavigatorKey,
          builder: (BuildContext context, GoRouterState state) {
            return const ResetPasswordView();
          },
        ),
        ShellRoute(
          navigatorKey: AppKeys.shellNavigatorKey,
          builder: (context, state, child) {
            return NavigationView(child: child);
          },
          routes: [
            /// The first screen to display in the bottom navigation bar.
            GoRoute(
              name: RouteNames.home,
              path: AppPaths.home,
              builder: (BuildContext context, GoRouterState state) {
                return const HomPainterView();
              },
            ),
            GoRoute(
              name: RouteNames.search,
              path: AppPaths.search,
              builder: (BuildContext context, GoRouterState state) {
                return HomeView(path: state.location);
              },
            ),
            GoRoute(
              name: RouteNames.showcase,
              path: AppPaths.showcase,
              builder: (BuildContext context, GoRouterState state) {
                return HomeView(path: state.location);
              },
            ),
            GoRoute(
              name: RouteNames.settings,
              path: AppPaths.settings,
              builder: (BuildContext context, GoRouterState state) {
                return const SettingsView();
              },
              routes: [
                GoRoute(
                  name: RouteNames.changeLocale,
                  path: AppPaths.changeLocale,
                  builder: (BuildContext context, GoRouterState state) {
                    return const ChangeLocaleView();
                  },
                ),
                GoRoute(
                  name: RouteNames.profile,
                  path: AppPaths.profile,
                  builder: (BuildContext context, GoRouterState state) {
                    final id = state.params['userId'];
                    if (id != null) {
                      return ProfileView(userId: id);
                    }
                    return const ErrorView(message: 'All params not found!');
                  },
                  routes: [
                    GoRoute(
                      name: RouteNames.updateProfile,
                      path: AppPaths.updateProfile,
                      builder: (BuildContext context, GoRouterState state) {
                        final id = state.params['userId'];
                        if (id != null) {
                          return UpdateProfileView(userId: id);
                        }
                        return const ErrorView(
                            message: 'All params not found!');
                      },
                      redirect: (context, state) {
                        if (isAuth) return null;
                        return AppPaths.login;
                      },
                      routes: [
                        GoRoute(
                          name: RouteNames.editName,
                          path: AppPaths.editName,
                          builder: (BuildContext context, GoRouterState state) {
                            return const EditNameView();
                          },
                        ),
                        GoRoute(
                          name: RouteNames.updateEmail,
                          path: AppPaths.updateEmail,
                          builder: (BuildContext context, GoRouterState state) {
                            return const UpdateEmailView();
                          },
                        ),
                        GoRoute(
                          name: RouteNames.changePassword,
                          path: AppPaths.changePassword,
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
      ];
}
