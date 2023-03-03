import '../../../../../core_packages.dart';
import '../../../data/repositories/i_auth_repository.dart';
import '../../auth_controller.dart';

final updateProfileControllerProvider = StateNotifierProvider.autoDispose<
    UpdateProfileController, AsyncValue<void>>((ref) {
  final authRepo = ref.watch(authRepoProvider);
  return UpdateProfileController(authRepo);
});

class UpdateProfileController extends StateNotifier<AsyncValue<void>> {
  final IAuthRepository _authRepo;
  UpdateProfileController(this._authRepo) : super(const AsyncData(null));

  Future<void> logout() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _authRepo.signOut(),
    );
  }
}
