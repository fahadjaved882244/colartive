import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../service/auth_service.dart';
import '../../auth_controller.dart';

final editNameControllerProvider =
    StateNotifierProvider.autoDispose<EditNameController, AsyncValue<void>>(
        (ref) {
  final authService = ref.watch(authServiceProvider);
  return EditNameController(authService);
});

class EditNameController extends StateNotifier<AsyncValue<void>> {
  final AuthService _authService;
  EditNameController(this._authService) : super(const AsyncData(null));

  Future<void> updateDetails(
      {required String name, required String bio}) async {
    FocusManager.instance.primaryFocus?.unfocus();

    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _authService.updateDetails(name, bio));
  }
}
