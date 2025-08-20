import 'package:colartive2/features/auth/data/repositories/auth_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/repositories/i_auth_repository.dart';
import '../model/auth_user.dart';

final authRepoProvider = Provider<IAuthRepository>((_) {
  return AuthRepository();
});

final _authStreamProvider = StreamProvider<AuthUser?>((ref) {
  final authRepo = ref.watch(authRepoProvider);
  return authRepo.authStateChange;
});

final authStateProvider = StateProvider<AuthUser?>((ref) {
  final authStream = ref.watch(_authStreamProvider);
  return authStream.valueOrNull;
});
