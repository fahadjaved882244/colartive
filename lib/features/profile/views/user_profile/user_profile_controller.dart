import 'dart:async';

import 'package:colartive2/features/auth/views/auth_controller.dart';
import 'package:colartive2/utils/state/base_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_profile_controller.g.dart';

@riverpod
class UserProfileController extends _$UserProfileController {
  @override
  BaseState build() {
    return const BaseState.initial();
  }

  Future<void> verifyEmail() async {
    state = const BaseState.loading();

    state = await BaseState.guard(
      ref.read(authControllerProvider.notifier).verifyEmail(),
    );
  }
}
