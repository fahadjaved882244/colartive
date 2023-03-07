import '../../../../../core_packages.dart';
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
