import '../../../../../core_packages.dart';
import '../../../data/repositories/i_auth_repository.dart';
import '../../auth_controller.dart';

final changePasswordControllerProvider = StateNotifierProvider.autoDispose<
    ChangePasswordController, AsyncValue<void>>((ref) {
  final authRepo = ref.watch(authRepoProvider);
  return ChangePasswordController(authRepo);
});

class ChangePasswordController extends StateNotifier<AsyncValue<void>> {
  final IAuthRepository _authRepo;
  ChangePasswordController(this._authRepo) : super(const AsyncData(null));

  Future<void> changePassword(
      {required String old, required String next}) async {
    FocusManager.instance.primaryFocus?.unfocus();

    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => _authRepo.changePassword(newPassword: next, oldPassword: old));
  }
}
