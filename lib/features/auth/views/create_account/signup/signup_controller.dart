import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../service/auth_service.dart';
import '../../auth_controller.dart';

final signupControllerProvider =
    StateNotifierProvider.autoDispose<SignupController, AsyncValue<void>>(
        (ref) {
  final authService = ref.watch(authServiceProvider);
  return SignupController(authService);
});

class SignupController extends StateNotifier<AsyncValue<void>> {
  final AuthService _authService;
  SignupController(this._authService) : super(const AsyncData(null));

  Future<void> signup({
    required String email,
    required String password,
    required String name,
  }) async {
    FocusManager.instance.primaryFocus?.unfocus();

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _authService.signup(
        email: email,
        password: password,
        body: {"name": name},
      ),
    );
  }
}
