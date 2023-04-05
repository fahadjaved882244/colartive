import 'dart:async';

import 'package:colartive2/utils/error/app_error.dart';
import 'package:colartive2/utils/state/base_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core_packages.dart';
import '../../auth_controller.dart';

part 'login_controller.g.dart';

@riverpod
class LoginController extends _$LoginController {
  @override
  BaseState build() {
    return const BaseState.initial();
  }

  Future<void> login({required String email, required String password}) async {
    FocusManager.instance.primaryFocus?.unfocus();

    state = const BaseState.loading();
    final result = await BaseState.guard(
      ref
          .read(authControllerProvider.notifier)
          .login(email: email, password: password),
    );
    // Incase Authenticated by FirebaseAuth but error occurs or can't find user in Firestore(database)
    if (result == const BaseState.error(error: AppError.unExpectedAuth())) {
      state = await BaseState.guard(
        ref.read(authControllerProvider.notifier).signOut(),
      );
    } else {
      state = result;
    }
  }

  Future<void> signInWithGoogle() async {
    state = const BaseState.loading();

    final result = await BaseState.guard(
      ref.read(authControllerProvider.notifier).signInWithGoogle(),
    );

    // Incase Authenticated by GoogleAuth but error occurs or can't find user in Firestore(database)
    if (result == const BaseState.error(error: AppError.unExpectedAuth())) {
      state = await BaseState.guard(
        ref.read(authControllerProvider.notifier).signOut(),
      );
    } else {
      state = result;
    }
  }
}
