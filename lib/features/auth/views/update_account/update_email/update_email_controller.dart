import 'package:colartive2/utils/state/base_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core_packages.dart';
import '../../auth_controller.dart';

part 'update_email_controller.g.dart';

@riverpod
class UpdateEmailController extends _$UpdateEmailController {
  @override
  BaseState build() {
    return const BaseState.initial();
  }

  Future<void> updateEmail({
    required String email,
    required String password,
  }) async {
    FocusManager.instance.primaryFocus?.unfocus();

    state = const BaseState.loading();
    state = await BaseState.guard(
      ref
          .read(authControllerProvider.notifier)
          .updateEmail(newEmail: email, password: password),
    );
  }
}
