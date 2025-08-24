import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/repositories/auth_repositories/auth_repository.dart';
import '../data/repositories/auth_repositories/i_auth_repository.dart';
import '../data/repositories/user_repositories/i_user_repository.dart';
import '../data/repositories/user_repositories/user_repository.dart';
import '../model/app_user.dart';
import '../service/auth_service.dart';

final authRepositoryProvider = Provider<IAuthRepository>((_) {
  return AuthRepository();
});

final userRepositoryProvider = Provider<IUserRepository>((_) {
  return UserRepository();
});

final authServiceProvider = Provider<AuthService>((ref) {
  final authRepo = ref.watch(authRepositoryProvider);
  final userRepo = ref.watch(userRepositoryProvider);
  return AuthService(authRepo, userRepo);
});

final _authStreamProvider = StreamProvider<AppUser?>((ref) {
  final authRepo = ref.watch(authRepositoryProvider);
  return authRepo.authStateChange;
});

final authStateProvider = StateProvider<AppUser?>((ref) {
  final authStream = ref.watch(_authStreamProvider);
  return authStream.valueOrNull;
});
