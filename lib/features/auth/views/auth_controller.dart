import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/providers/firebase_providers.dart';
import '../data/repositories/i_auth_repository.dart';
import '../data/repositories/mock_auth_repository.dart';
import '../data/repositories/user_repository.dart';
import '../model/auth_user.dart';

final authRepoProvider = Provider<IAuthRepository>((_) {
  // TODO: Change the Repository you want to use
  return MockAuthRepository();
});

final userRepoProvider = Provider(
  (ref) {
    final firestore = ref.watch(firestoreProvider);
    return UserRepository(firestore);
  },
);

final authStateProvider = StreamProvider<AuthUser?>((ref) {
  final authRepo = ref.watch(authRepoProvider);
  final userRepo = ref.watch(userRepoProvider);

  return authRepo.authStateChange.distinct()
    ..listen((user) async {
      if (user != null) {
        final data = await userRepo.read(user.id);
        if (data != user) {
          userRepo.create(user);
        }
      }
    });
});
