import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../service/auth_service.dart';
import '../../auth_controller.dart';

final updateEmailControllerProvider =
    StateNotifierProvider.autoDispose<UpdateEmailController, AsyncValue<void>>(
        (ref) {
  final authService = ref.watch(authServiceProvider);
  return UpdateEmailController(authService);
});

class UpdateEmailController extends StateNotifier<AsyncValue<void>> {
  final AuthService _authService;
  UpdateEmailController(this._authService) : super(const AsyncData(null));

  Future<void> updateEmail(
      {required String email, required String password}) async {
    FocusManager.instance.primaryFocus?.unfocus();

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _authService.updateEmail(newEmail: email, password: password),
    );
  }
}
