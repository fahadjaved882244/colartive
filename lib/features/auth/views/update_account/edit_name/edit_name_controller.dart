import 'package:colartive2/features/auth/views/auth_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core_packages.dart';

part 'edit_name_controller.g.dart';

@riverpod
class EditNameController extends _$EditNameController {
  @override
  AsyncValue build() {
    return const AsyncData(null);
  }

  Future<void> updateName({required String name}) async {
    FocusManager.instance.primaryFocus?.unfocus();

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(authRepoProvider).updateName(name),
    );
  }
}
