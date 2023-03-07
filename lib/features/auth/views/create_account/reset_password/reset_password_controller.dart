import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core_packages.dart';
import '../../auth_controller.dart';

part 'reset_password_controller.g.dart';

@riverpod
class ResetPasswordController extends _$ResetPasswordController {
  @override
  FutureOr build() {}

  Future<void> resetPassword({required String email}) async {
    FocusManager.instance.primaryFocus?.unfocus();

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(authRepoProvider).forgotPassword(email),
    );
  }
}
