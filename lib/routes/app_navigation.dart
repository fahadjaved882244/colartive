import 'package:colartive2/routes/app_paths.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

extension AppNavigation on BuildContext {
  /// Navigate to the home page.
  void goHome() {
    go(AppPaths.home);
  }

  void goCanvasLive({required String templateId}) {
    go(Uri.parse("${AppPaths.canvasLivePath}?templateId=$templateId")
        .toString());
  }

  void goCanvasFull({required String templateId}) {
    go(Uri.parse("${AppPaths.canvasFullPath}?templateId=$templateId")
        .toString());
  }

  /// Navigate to the settings page.
  void goSettings() {
    go(AppPaths.settingsPath);
  }

  /// Navigate to the user profile page.
  void goUserProfile() {
    go(AppPaths.profilePath);
  }

  /// Navigate to the update profile page.
  void goUpdateProfile() {
    go(AppPaths.updateProfilePath);
  }

  /// Navigate to the update email page.
  void goUpdateEmail() {
    go(AppPaths.updateEmailPath);
  }

  /// Navigate to the edit name page.
  void goEditName() {
    go(AppPaths.editNamePath);
  }

  /// Navigate to the change password page.
  void goChangePassword() {
    go(AppPaths.changePasswordPath);
  }

  /// Navigate to the login page.
  void goLogin() {
    go(AppPaths.loginPath);
  }

  /// Navigate to the signup page.
  void goSignup() {
    go(AppPaths.signupPath);
  }

  /// Navigate to the reset password page.
  void goResetPassword() {
    go(AppPaths.resetPasswordPath);
  }
}
