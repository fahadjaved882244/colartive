import 'package:colartive2/core_packages.dart';
import 'package:colartive2/features/auth/views/auth_controller.dart';
import 'package:colartive2/features/profile/views/contributor_profile/contributor_profile_view.dart';
import 'package:colartive2/features/vector_art/views/search/search_view.dart';
import 'package:colartive2/features/vector_art/views/showcase/showcase_view.dart';

import '../../app_keys.dart';
import '../../features/auth/views/create_account/login/login_view.dart';
import '../../features/auth/views/create_account/reset_password/reset_password_view.dart';
import '../../features/auth/views/create_account/signup/signup_view.dart';
import '../../features/auth/views/update_account/change_password/change_password_view.dart';
import '../../features/auth/views/update_account/update_email/update_email_view.dart';
import '../../features/auth/views/update_account/update_profile/update_profile_view.dart';
import '../../features/auth/views/update_account/update_user_details/update_user_details_view.dart';
import '../../features/locale/view/change_locale_view.dart';
import '../../features/others/navigation/navigation_view.dart';
import '../../features/others/settings/settings_view.dart';
import '../../features/profile/views/user_profile/user_profile_view.dart';
import '../../features/vector_art/views/home/home_view.dart';
import '../../utils/components/widgets/error_view.dart';

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
    final state = ref.watch(authStateProvider);
    state.whenOrNull(data: (value) => isAuth = value);

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
        GoRoute(
          name: RouteNames.contributorProfile,
          path: AppPaths.contributor,
          parentNavigatorKey: AppKeys.rootNavigatorKey,
          builder: (BuildContext context, GoRouterState state) {
            final uid = state.params["userId"];
            if (uid != null) {
              return ContributorProfileView(uid);
            } else {
              return const ErrorView(message: "User Id not found");
            }
          },
        ),
        GoRoute(
          name: RouteNames.artistProfile,
          path: AppPaths.designer,
          parentNavigatorKey: AppKeys.rootNavigatorKey,
          builder: (BuildContext context, GoRouterState state) {
            if (state.params["userId"] != null) {
              return const ResetPasswordView();
            } else {
              return const ErrorView(message: "User Id not found");
            }
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
                return const HomeView();
              },
            ),
            GoRoute(
              name: RouteNames.search,
              path: AppPaths.search,
              builder: (BuildContext context, GoRouterState state) {
                return const SearchView();
              },
            ),
            GoRoute(
              name: RouteNames.showcase,
              path: AppPaths.showcase,
              builder: (BuildContext context, GoRouterState state) {
                return const ShowCaseView();
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
                  name: RouteNames.userProfile,
                  path: AppPaths.userProfile,
                  redirect: (context, state) {
                    if (isAuth) return null;
                    return AppPaths.login;
                  },
                  builder: (BuildContext context, GoRouterState state) {
                    return const UserProfileView();
                  },
                  routes: [
                    GoRoute(
                      name: RouteNames.updateProfile,
                      path: AppPaths.updateProfile,
                      builder: (BuildContext context, GoRouterState state) {
                        return const UpdateProfileView();
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
                            return const UpdateUserDetailsView();
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
