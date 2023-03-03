import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/repositories/i_auth_repository.dart';
import '../data/repositories/mock_auth_repository.dart';
import '../model/auth_user.dart';

final authRepoProvider = Provider<IAuthRepository>((_) {
  // TODO: Change the Repository you want to use
  return MockAuthRepository();
});

final _authStreamProvider = StreamProvider<AuthUser?>((ref) {
  final authRepo = ref.watch(authRepoProvider);
  return authRepo.authStateChange;
});

final authStateProvider = StateProvider<AuthUser?>((ref) {
  final authRepo = ref.watch(_authStreamProvider);
  return authRepo.valueOrNull;
});
