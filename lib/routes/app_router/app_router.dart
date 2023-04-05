import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../app_keys.dart';

import '../../utils/components/widgets/error_view.dart';
import '../app_paths.dart';
import 'app_router_notifier.dart';

//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
//////////////// ROUTER DEFINATION ///////////////////////
//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////

final routerProvider = Provider.autoDispose<GoRouter>((ref) {
  final notifier = ref.watch(routerNotifierProvider.notifier);

  return GoRouter(
    navigatorKey: AppKeys.rootNavigatorKey,
    initialLocation: AppPaths.home,
    refreshListenable: notifier,
    routes: notifier.routes,
    errorBuilder: (c, s) => ErrorView(message: s.error?.toString() ?? 'Error!'),
  );
});

// @TypedGoRoute<LoginRoute>(
//   path: RouteNames.login,
// )
// @immutable
// class LoginRoute extends GoRouteData {
//   const LoginRoute();

//   @override
//   GlobalKey<NavigatorState>? get navigatorKey => _rootNavigatorKey;

//   @override
//   Widget build(BuildContext context, GoRouterState state) => const LoginView();
// }

// @TypedGoRoute<SignupRoute>(
//   path: RouteNames.signup,
// )
// @immutable
// class SignupRoute extends GoRouteData {
//   const SignupRoute();

//   @override
//   GlobalKey<NavigatorState>? get navigatorKey => _rootNavigatorKey;

//   @override
//   Widget build(BuildContext context, GoRouterState state) => const SignupView();
// }

// @TypedGoRoute<ResetPasswordRoute>(
//   path: RouteNames.resetPassword,
// )
// @immutable
// class ResetPasswordRoute extends GoRouteData {
//   const ResetPasswordRoute();

//   @override
//   GlobalKey<NavigatorState>? get navigatorKey => _rootNavigatorKey;

//   @override
//   Widget build(BuildContext context, GoRouterState state) =>
//       const ResetPasswordView();
// }

// //////////////////////////////////////////////////////
// ////////////// Shell Router /////////////////////////
// ////////////////////////////////////////////////////

// @TypedGoRoute<HomeRoute>(
//   path: RouteNames.home,
// )
// @immutable
// class HomeRoute extends GoRouteData {
//   const HomeRoute();
//   @override
//   Widget build(BuildContext context, GoRouterState state) =>
//       const HomPainterView();
// }

// @TypedGoRoute<SearchRoute>(
//   path: RouteNames.search,
// )
// @immutable
// class SearchRoute extends GoRouteData {
//   const SearchRoute();
//   @override
//   Widget build(BuildContext context, GoRouterState state) =>
//       HomeView(path: state.location);
// }

// @TypedGoRoute<ShowCaseRoute>(
//   path: RouteNames.showcase,
// )
// @immutable
// class ShowCaseRoute extends GoRouteData {
//   const ShowCaseRoute();
//   @override
//   Widget build(BuildContext context, GoRouterState state) =>
//       HomeView(path: state.location);
// }

// @TypedGoRoute<SettingsRoute>(
//   path: RouteNames.settings,
//   routes: [
//     TypedGoRoute<ChangeLocaleRoute>(
//       path: RouteNames.changeLocale,
//     ),
//     TypedGoRoute<ProfileRoute>(
//       path: RouteNames.profile,
//       routes: [
//         TypedGoRoute<UpdateProfileRoute>(
//           path: RouteNames.updateProfile,
//           routes: [
//             TypedGoRoute<EditNameRoute>(
//               path: RouteNames.editName,
//             ),
//             TypedGoRoute<UpdateEmailRoute>(
//               path: RouteNames.updateEmail,
//             ),
//             TypedGoRoute<ChangePasswordRoute>(
//               path: RouteNames.changePassword,
//             ),
//           ],
//         ),
//       ],
//     ),
//   ],
// )
// @immutable
// class SettingsRoute extends GoRouteData {
//   const SettingsRoute();
//   @override
//   Widget build(BuildContext context, GoRouterState state) =>
//       const SettingsView();
// }

// @immutable
// class ChangeLocaleRoute extends GoRouteData {
//   const ChangeLocaleRoute();
//   @override
//   Widget build(BuildContext context, GoRouterState state) =>
//       const ChangeLocaleView();
// }

// @immutable
// class ProfileRoute extends GoRouteData {
//   final String id;
//   const ProfileRoute({required this.id});

//   @override
//   Widget build(BuildContext context, GoRouterState state) {
//     return ProfileView(id: id);
//   }
// }

// @immutable
// class UpdateProfileRoute extends GoRouteData {
//   final String id;
//   const UpdateProfileRoute({required this.id});

//   @override
//   Widget build(BuildContext context, GoRouterState state) =>
//       UpdateProfileView(id: id);
// }

// @immutable
// class EditNameRoute extends GoRouteData {
//   final String id;
//   const EditNameRoute({required this.id});

//   @override
//   Widget build(BuildContext context, GoRouterState state) =>
//       const EditNameView();
// }

// @immutable
// class UpdateEmailRoute extends GoRouteData {
//   final String id;
//   const UpdateEmailRoute({required this.id});

//   @override
//   Widget build(BuildContext context, GoRouterState state) =>
//       const UpdateEmailView();
// }

// @immutable
// class ChangePasswordRoute extends GoRouteData {
//   final String id;
//   const ChangePasswordRoute({required this.id});

//   @override
//   Widget build(BuildContext context, GoRouterState state) =>
//       const ChangePasswordView();
// }

// @immutable
// class ErrorRoute extends GoRouteData {
//   final Exception error;
//   const ErrorRoute({required this.error});

//   @override
//   Widget build(BuildContext context, GoRouterState state) =>
//       ErrorView(message: error.toString());
// }
