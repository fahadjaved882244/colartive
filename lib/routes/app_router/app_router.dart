import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

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
import '../app_paths.dart';

part 'app_router.g.dart';

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

@TypedGoRoute<HomeRoute>(
  path: RouteNames.home,
)
@immutable
class HomeRoute extends GoRouteData {
  const HomeRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      HomeView(path: state.location);
}

@TypedGoRoute<SearchRoute>(
  path: RouteNames.search,
)
@immutable
class SearchRoute extends GoRouteData {
  const SearchRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      HomeView(path: state.location);
}

@TypedGoRoute<ShowCaseRoute>(
  path: RouteNames.showcase,
)
@immutable
class ShowCaseRoute extends GoRouteData {
  const ShowCaseRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      HomeView(path: state.location);
}

@TypedGoRoute<SettingsRoute>(
  path: RouteNames.settings,
  routes: [
    TypedGoRoute<ChangeLocaleRoute>(
      path: RouteNames.changeLocale,
    ),
    TypedGoRoute<LoginRoute>(
      path: RouteNames.login,
      routes: [
        TypedGoRoute<SignupRoute>(
          path: RouteNames.signup,
        ),
        TypedGoRoute<ResetPasswordRoute>(
          path: RouteNames.resetPassword,
        ),
      ],
    ),
    TypedGoRoute<ProfileRoute>(
      path: RouteNames.profile,
      routes: [
        TypedGoRoute<UpdateProfileRoute>(
          path: RouteNames.updateProfile,
          routes: [
            TypedGoRoute<EditNameRoute>(
              path: RouteNames.editName,
            ),
            TypedGoRoute<UpdateEmailRoute>(
              path: RouteNames.updateEmail,
            ),
            TypedGoRoute<ChangePasswordRoute>(
              path: RouteNames.changePassword,
            ),
          ],
        ),
      ],
    ),
  ],
)
@immutable
class SettingsRoute extends GoRouteData {
  const SettingsRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SettingsView();
}

@immutable
class ChangeLocaleRoute extends GoRouteData {
  const ChangeLocaleRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ChangeLocaleView();
}

@immutable
class LoginRoute extends GoRouteData {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const LoginView();
}

@immutable
class SignupRoute extends GoRouteData {
  const SignupRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const SignupView();
}

@immutable
class ResetPasswordRoute extends GoRouteData {
  const ResetPasswordRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ResetPasswordView();
}

@immutable
class ProfileRoute extends GoRouteData {
  final String id;
  const ProfileRoute({required this.id});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ProfileView(id: id);
  }
}

@immutable
class UpdateProfileRoute extends GoRouteData {
  final String id;
  const UpdateProfileRoute({required this.id});

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      UpdateProfileView(id: id);
}

@immutable
class EditNameRoute extends GoRouteData {
  final String id;
  const EditNameRoute({required this.id});

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const EditNameView();
}

@immutable
class UpdateEmailRoute extends GoRouteData {
  final String id;
  const UpdateEmailRoute({required this.id});

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const UpdateEmailView();
}

@immutable
class ChangePasswordRoute extends GoRouteData {
  final String id;
  const ChangePasswordRoute({required this.id});

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ChangePasswordView();
}

@immutable
class ErrorRoute extends GoRouteData {
  final Exception error;
  const ErrorRoute({required this.error});

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      ErrorView(message: error.toString());
}

final router = GoRouter(
  initialLocation: RouteNames.home,
  errorBuilder: (c, s) => ErrorRoute(error: s.error!).build(c, s),
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return NavigationView(child: child);
      },
      routes: $appRoutes,
    ),
  ],

  // routes: [
  //   ShellRoute(
  // builder: (context, state, child) {
  //   return NavigationView(child: child);
  // },
  //     routes: <RouteBase>[
  //       /// The first screen to display in the bottom navigation bar.
  //       GoRoute(
  //         path: RouteNames.home,
  //         builder: (BuildContext context, GoRouterState state) {
  //           return HomeView(path: state.location);
  //         },
  //       ),
  //       GoRoute(
  //         path: RouteNames.search,
  //         builder: (BuildContext context, GoRouterState state) {
  //           return HomeView(path: state.location);
  //         },
  //       ),
  //       GoRoute(
  //         path: RouteNames.showcase,
  //         builder: (BuildContext context, GoRouterState state) {
  //           return HomeView(path: state.location);
  //         },
  //       ),
  //       GoRoute(
  //         path: RouteNames.settings,
  //         builder: (BuildContext context, GoRouterState state) {
  //           return const SettingsView();
  //         },
  //         routes: [
  //           GoRoute(
  //             path: RouteNames.changeLocale,
  //             builder: (BuildContext context, GoRouterState state) {
  //               return const ChangeLocaleView();
  //             },
  //           ),
  //           GoRoute(
  //             path: RouteNames.login,
  //             builder: (context, state) {
  //               return const LoginView();
  //             },
  //             routes: [
  //               GoRoute(
  //                 path: RouteNames.signup,
  //                 builder: (context, state) {
  //                   return const SignupView();
  //                 },
  //               ),
  //               GoRoute(
  //                 path: RouteNames.resetPassword,
  //                 builder: (BuildContext context, GoRouterState state) {
  //                   return const ResetPasswordView();
  //                 },
  //               ),
  //             ],
  //           ),
  //           GoRoute(
  //             path: RouteNames.userProfile,
  //             builder: (BuildContext context, GoRouterState state) {
  //               final id = state.queryParams['id'];
  //               final name = state.queryParams['name'];
  //               final photoUrl = state.queryParams['photoUrl']?.nullIfEmpty;
  //               if (id != null && name != null) {
  //                 return ProfileView(
  //                   id: id,
  //                   name: name,
  //                   photoUrl: photoUrl,
  //                 );
  //               }
  //               return const ErrorView(message: 'All params not found!');
  //             },
  //             routes: [
  //               GoRoute(
  //                 path: RouteNames.updateProfile,
  //                 builder: (BuildContext context, GoRouterState state) {
  //                   return const UpdateProfileView();
  //                 },
  //                 routes: [
  //                   GoRoute(
  //                     path: RouteNames.editName,
  //                     builder: (BuildContext context, GoRouterState state) {
  //                       return const EditNameView();
  //                     },
  //                   ),
  //                   GoRoute(
  //                     path: RouteNames.updateEmail,
  //                     builder: (BuildContext context, GoRouterState state) {
  //                       return const UpdateEmailView();
  //                     },
  //                   ),
  //                   GoRoute(
  //                     path: RouteNames.changePassword,
  //                     builder: (BuildContext context, GoRouterState state) {
  //                       return const ChangePasswordView();
  //                     },
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ],
  //   ),
  // ],
);
