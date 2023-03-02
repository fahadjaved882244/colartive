import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/profile_repository.dart';
import '../model/app_user.dart';

final appUserRepoProvider = Provider<ProfileRepository>((ref) {
  return ProfileRepository();
});

final appUserStreamProvider =
    StreamProvider.autoDispose.family<AppUser, String>((ref, id) {
  return ref.watch(appUserRepoProvider).watchAppUser(id);
});
