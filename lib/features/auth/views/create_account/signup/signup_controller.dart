import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core_packages.dart';
import '../../auth_controller.dart';

part 'signup_controller.g.dart';

@riverpod
class SignupController extends _$SignupController {
  @override
  FutureOr build() {}

  Future<void> signup({
    required String email,
    required String password,
    required String name,
  }) async {
    FocusManager.instance.primaryFocus?.unfocus();

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(authRepoProvider).signup(
        email: email,
        password: password,
        body: {"name": name},
      ),
    );
  }
}
