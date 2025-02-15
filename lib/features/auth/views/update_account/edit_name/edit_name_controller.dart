import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../profile/data/profile_repository.dart';
import '../../../../profile/views/profile_controller.dart';
import '../../../data/repositories/i_auth_repository.dart';
import '../../auth_controller.dart';

final editNameControllerProvider =
    StateNotifierProvider.autoDispose<EditNameController, AsyncValue<void>>(
        (ref) {
  final authRepo = ref.watch(authRepoProvider);
  return EditNameController(authRepo);
});

class EditNameController extends StateNotifier<AsyncValue<void>> {
  final IAuthRepository _authRepo;
  EditNameController(this._authRepo) : super(const AsyncData(null));

  Future<void> updateName({required String name}) async {
    FocusManager.instance.primaryFocus?.unfocus();

    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _authRepo.updateName(name));
  }
}

final profileControllerProvider =
    StateNotifierProvider.autoDispose<ProfileController, AsyncValue<void>>(
        (ref) {
  final userRepo = ref.watch(appUserRepoProvider);
  return ProfileController(userRepo);
});

class ProfileController extends StateNotifier<AsyncValue<void>> {
  final ProfileRepository _appUserRepo;
  ProfileController(this._appUserRepo) : super(const AsyncLoading());

  Future<void> updateBio(String id, String bio) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _appUserRepo.updateBio(id, bio));
  }
}
