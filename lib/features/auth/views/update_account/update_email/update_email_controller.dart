import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core_packages.dart';
import '../../auth_controller.dart';

part 'update_email_controller.g.dart';

@riverpod
class UpdateEmailController extends _$UpdateEmailController {
  @override
  AsyncValue build() {
    return const AsyncData(null);
  }

  Future<void> updateEmail(
      {required String email, required String password}) async {
    FocusManager.instance.primaryFocus?.unfocus();

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref
          .read(authRepoProvider)
          .updateEmail(newEmail: email, password: password),
    );
  }
}
