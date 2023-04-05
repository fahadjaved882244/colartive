import 'dart:async';

import 'package:colartive2/utils/state/base_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core_packages.dart';
import '../../auth_controller.dart';

part 'reset_password_controller.g.dart';

@riverpod
class ResetPasswordController extends _$ResetPasswordController {
  @override
  BaseState build() {
    return const BaseState.initial();
  }

  Future<void> resetPassword({required String email}) async {
    FocusManager.instance.primaryFocus?.unfocus();

    state = const BaseState.loading();
    state = await BaseState.guard(
      ref.read(authControllerProvider.notifier).resetPassword(email),
    );
  }
}
