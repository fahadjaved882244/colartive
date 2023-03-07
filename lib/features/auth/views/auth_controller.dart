import 'package:colartive2/features/auth/data/repositories/auth_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../utils/providers/core_providers.dart';
import '../data/repositories/i_auth_repository.dart';
import '../data/repositories/user_repository.dart';
import '../model/auth_user.dart';

final authRepoProvider = Provider<IAuthRepository>((ref) {
  // TODO: Change the Repository you want to use
  // return MockAuthRepository();
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  return AuthRepository(firebaseAuth);
});

final userRepoProvider = Provider(
  (ref) {
    final firestore = ref.watch(firestoreProvider);
    return UserRepository(firestore);
  },
);

final authStateProvider = StreamProvider<AuthUser?>((ref) {
  final authRepo = ref.watch(authRepoProvider);

  return authRepo.authStateChange.distinct()
    ..listen((user) async {
      if (user != null) {
        final userRepo = ref.read(userRepoProvider);
        final data = await userRepo.read(user.id);
        if (data != user) {
          await userRepo.create(user);
        }
      }
    });
});
