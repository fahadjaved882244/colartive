import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core_packages.dart';
import '../../auth_controller.dart';

part 'change_password_controller.g.dart';

@riverpod
class ChangePasswordController extends _$ChangePasswordController {
  @override
  AsyncValue build() {
    return const AsyncData(null);
  }

  Future<void> changePassword(
      {required String old, required String next}) async {
    FocusManager.instance.primaryFocus?.unfocus();

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref
          .read(authRepoProvider)
          .changePassword(newPassword: next, oldPassword: old),
    );
  }
}
