import 'package:colartive2/utils/components/popups/custom_snackbar.dart';
import 'package:colartive2/utils/state/base_state.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension BaseStateX<T> on BaseState<T> {
  bool get isLoading => this == BaseState<T>.loading();

  void showError(BuildContext context) {
    whenOrNull(
      error: (error) {
        showCustomSnackBar(context, error.message);
      },
    );
  }

  void showErrorOrNav(BuildContext context, String routeName) {
    whenOrNull(
      data: (data) => context.goNamed(routeName),
      error: (error) {
        showCustomSnackBar(context, error.message);
      },
    );
  }

  void showErrorOrSuccOrNav(
    BuildContext context, {
    required String success,
    required String routeName,
  }) {
    whenOrNull(
      data: (data) {
        context.goNamed(routeName);
        showCustomSnackBar(context, success);
      },
      error: (error) {
        showCustomSnackBar(context, error.message);
      },
    );
  }

  Widget defaultWhen({required Widget Function(T) data}) {
    return when(
      data: data,
      initial: () => const SizedBox(),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error) => Center(child: Text(error.message)),
    );
  }

  Widget defaultWhenSliver({required Widget Function(T) data}) {
    return when(
      data: data,
      initial: () => const SliverFillRemaining(),
      loading: () => const SliverFillRemaining(
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (error) => SliverFillRemaining(
        child: Center(child: Text(error.toString())),
      ),
    );
  }
}
