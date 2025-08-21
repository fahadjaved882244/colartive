import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../auth/model/app_user.dart';
import '../../auth/views/auth_controller.dart';

final userProfileProvider = FutureProvider<AppUser?>((ref) {
  final authState = ref.watch(authStateProvider);
  if (authState != null) {
    return ref.watch(userRepositoryProvider).read(authState.id);
  }
  return Future.value(null);
});

final otherProfileProvider =
    FutureProvider.autoDispose.family<AppUser?, String>((ref, id) {
  return ref.watch(userRepositoryProvider).read(id);
});
