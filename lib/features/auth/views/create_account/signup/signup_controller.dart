import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../data/repositories/i_auth_repository.dart';
import '../../auth_controller.dart';

final signupControllerProvider =
    StateNotifierProvider.autoDispose<SignupController, AsyncValue<void>>(
        (ref) {
  final authRepo = ref.watch(authRepoProvider);
  return SignupController(authRepo);
});

class SignupController extends StateNotifier<AsyncValue<void>> {
  final IAuthRepository _authRepo;
  SignupController(this._authRepo) : super(const AsyncData(null));

  Future<void> signup({
    required String email,
    required String password,
    required String name,
  }) async {
    FocusManager.instance.primaryFocus?.unfocus();

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _authRepo.signup(
        email: email,
        password: password,
        body: {"name": name},
      ),
    );
  }
}
