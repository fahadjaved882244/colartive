import 'package:colartive2/utils/state/base_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core_packages.dart';
import '../../auth_controller.dart';

part 'update_user_details_controller.g.dart';

@riverpod
class UpdateUserDetailsController extends _$UpdateUserDetailsController {
  @override
  BaseState build() {
    return const BaseState.initial();
  }

  Future<void> updateDetails({
    required String name,
    required String bio,
  }) async {
    FocusManager.instance.primaryFocus?.unfocus();

    state = const BaseState.loading();
    state = await BaseState.guard(
      ref
          .read(authControllerProvider.notifier)
          .updateUserDetails(name: name, bio: bio),
    );
  }
}
