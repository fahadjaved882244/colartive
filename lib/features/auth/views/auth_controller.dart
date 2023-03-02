import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/repositories/i_auth_repository.dart';
import '../data/repositories/mock_auth_repository.dart';
import '../model/auth_user.dart';

final authRepoProvider = Provider<IAuthRepository>((_) {
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
