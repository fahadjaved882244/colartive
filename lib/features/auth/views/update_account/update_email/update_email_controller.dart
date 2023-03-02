import '../../../../../core_packages.dart';
import '../../../data/repositories/i_auth_repository.dart';
import '../../auth_controller.dart';

final updateEmailControllerProvider =
    StateNotifierProvider.autoDispose<UpdateEmailController, AsyncValue<void>>(
        (ref) {
  final authRepo = ref.watch(authRepoProvider);
  return UpdateEmailController(authRepo);
});

class UpdateEmailController extends StateNotifier<AsyncValue<void>> {
  final IAuthRepository _authRepo;
  UpdateEmailController(this._authRepo) : super(const AsyncData(null));

  Future<void> updateEmail(
      {required String email, required String password}) async {
    FocusManager.instance.primaryFocus?.unfocus();

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _authRepo.updateEmail(newEmail: email, password: password),
    );
  }
}
