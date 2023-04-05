import 'package:colartive2/utils/state/base_state.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core_packages.dart';
import '../../auth_controller.dart';

part 'signup_controller.g.dart';

@riverpod
class SignupController extends _$SignupController {
  @override
  BaseState<Unit> build() {
    return const BaseState<Unit>.initial();
  }

  Future<void> signup({
    required String email,
    required String password,
    required String name,
  }) async {
    FocusManager.instance.primaryFocus?.unfocus();

    state = const BaseState<Unit>.loading();
    state = await BaseState.guard<Unit>(
      ref.read(authControllerProvider.notifier).signup(
            email: email,
            password: password,
            name: name,
          ),
    );
  }
}
