import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../service/auth_service.dart';
import '../../auth_controller.dart';

final changePasswordControllerProvider = StateNotifierProvider.autoDispose<
    ChangePasswordController, AsyncValue<void>>((ref) {
  final authService = ref.watch(authServiceProvider);
  return ChangePasswordController(authService);
});

class ChangePasswordController extends StateNotifier<AsyncValue<void>> {
  final AuthService _authService;
  ChangePasswordController(this._authService) : super(const AsyncData(null));

  Future<void> changePassword(
      {required String old, required String next}) async {
    FocusManager.instance.primaryFocus?.unfocus();

    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => _authService.changePassword(oldPassword: old, newPassword: next));
  }
}
