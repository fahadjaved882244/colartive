import 'dart:async';

import 'package:colartive2/utils/providers/core_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../auth_controller.dart';

part 'update_profile_controller.g.dart';

@riverpod
class UpdateProfileController extends _$UpdateProfileController {
  @override
  FutureOr<void> build() {}

  Future<void> logout() async {
    state = const AsyncLoading();

    final googleSignIn = ref.read(googleSignInProvider);
    if (await googleSignIn.isSignedIn()) {
      await googleSignIn.signOut();
    }
    state = await AsyncValue.guard(
      () => ref.read(authRepoProvider).signOut(),
    );
  }
}
