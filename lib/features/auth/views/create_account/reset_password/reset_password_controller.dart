import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../service/auth_service.dart';
import '../../auth_controller.dart';

final resetPasswordControllerProvider = StateNotifierProvider.autoDispose<
    ResetPasswordController, AsyncValue<void>>((ref) {
  final authService = ref.watch(authServiceProvider);
  return ResetPasswordController(authService);
});

class ResetPasswordController extends StateNotifier<AsyncValue<void>> {
  final AuthService _authService;
  ResetPasswordController(this._authService) : super(const AsyncData(null));

  Future<void> resetPassword({required String email}) async {
    FocusManager.instance.primaryFocus?.unfocus();

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _authService.forgotPassword(email),
    );
  }
}
