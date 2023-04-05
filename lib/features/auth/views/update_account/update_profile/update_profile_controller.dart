import 'dart:async';
import 'dart:typed_data';

import 'package:colartive2/utils/repositories/device_storage_repository.dart';
import 'package:colartive2/utils/state/base_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../auth_controller.dart';

part 'update_profile_controller.g.dart';

@riverpod
class UpdateProfileController extends _$UpdateProfileController {
  @override
  BaseState build() {
    return const BaseState.initial();
  }

  Future<void> signOut() async {
    state = const BaseState.loading();
    state = await BaseState.guard(
      ref.read(authControllerProvider.notifier).signOut(),
    );
  }
}

@riverpod
class UpdateUserImageController extends _$UpdateUserImageController {
  @override
  BaseState<Uint8List> build() {
    return const BaseState.initial();
  }

  Future<void> pickImage() async {
    state = const BaseState.loading();
    state = await BaseState.guard(
      ref.read(deviceStoragerRepoProvider).pickImage(),
    );
  }
}
