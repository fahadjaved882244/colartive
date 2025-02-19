import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../data/repositories/i_auth_repository.dart';
import '../../auth_controller.dart';

final loginControllerProvider =
    StateNotifierProvider.autoDispose<LoginController, AsyncValue<void>>((ref) {
  final authRepo = ref.watch(authRepoProvider);
  return LoginController(authRepo);
});

class LoginController extends StateNotifier<AsyncValue<void>> {
  final IAuthRepository authRepo;
  LoginController(this.authRepo) : super(const AsyncData(null));

  Future<void> login({required String email, required String password}) async {
    FocusManager.instance.primaryFocus?.unfocus();

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => authRepo.login(email: email, password: password),
    );
  }
}
