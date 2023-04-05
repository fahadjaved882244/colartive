import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core_packages.dart';
import '../../../../../utils/state/base_state.dart';
import '../../auth_controller.dart';

part 'change_password_controller.g.dart';

@riverpod
class ChangePasswordController extends _$ChangePasswordController {
  @override
  BaseState build() {
    return const BaseState.initial();
  }

  Future<void> changePassword(
      {required String old, required String next}) async {
    FocusManager.instance.primaryFocus?.unfocus();

    state = const BaseState.loading();
    state = await BaseState.guard(
      ref
          .read(authControllerProvider.notifier)
          .changePassword(newPassword: next, oldPassword: old),
    );
  }
}
