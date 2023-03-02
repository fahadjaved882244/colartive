import '../../../../../core_packages.dart';
import '../../../data/repositories/i_auth_repository.dart';
import '../../auth_controller.dart';

final resetPasswordControllerProvider = StateNotifierProvider.autoDispose<
    ResetPasswordController, AsyncValue<void>>((ref) {
  final authRepo = ref.watch(authRepoProvider);
  return ResetPasswordController(authRepo);
});

class ResetPasswordController extends StateNotifier<AsyncValue<void>> {
  final IAuthRepository _authRepo;
  ResetPasswordController(this._authRepo) : super(const AsyncData(null));

  Future<void> resetPassword({required String email}) async {
    FocusManager.instance.primaryFocus?.unfocus();

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _authRepo.forgotPassword(email),
    );
  }
}
