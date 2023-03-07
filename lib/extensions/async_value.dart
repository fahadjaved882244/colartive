import 'package:colartive2/features/auth/data/utils/auth_exceptions.dart';
import 'package:colartive2/utils/components/popups/custom_snackbar.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

extension AsyncValueX on AsyncValue<void> {
  // show a snackbar on error only
  void showErrorOrNavigate(BuildContext context, {String? routeName}) {
    whenOrNull(
      data: (data) => routeName != null ? context.goNamed(routeName) : null,
      error: (error, _) {
        if (error is AuthException) {
          showCustomSnackBar(context, error.message);
        } else {
          showCustomSnackBar(context, error.toString());
        }
      },
    );
  }

  void showErrorOrSuccess(BuildContext context, {String? successMsg}) {
    whenOrNull(
      data: (data) =>
          successMsg != null ? showCustomSnackBar(context, successMsg) : null,
      error: (error, _) {
        if (error is AuthException) {
          showCustomSnackBar(context, error.message);
        } else {
          showCustomSnackBar(context, error.toString());
        }
      },
    );
  }
}
