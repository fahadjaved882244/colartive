import 'package:colartive2/features/auth/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../auth_controller.dart';

final loginControllerProvider =
    StateNotifierProvider.autoDispose<LoginController, AsyncValue<void>>((ref) {
  final authService = ref.watch(authServiceProvider);
  return LoginController(authService);
});

class LoginController extends StateNotifier<AsyncValue<void>> {
  final AuthService authService;
  LoginController(this.authService) : super(const AsyncData(null));

  Future<void> login({required String email, required String password}) async {
    FocusManager.instance.primaryFocus?.unfocus();

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => authService.login(email: email, password: password),
    );
  }
}
