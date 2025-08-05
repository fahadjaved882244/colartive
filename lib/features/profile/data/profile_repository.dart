import 'package:colartive2/features/profile/model/app_user.dart';

class ProfileRepository {
  Stream<AppUser> watchAppUser(String id) async* {
    await Future.delayed(const Duration(seconds: 2));
    yield AppUser(
      id: '213',
      contributions: 23,
      totalUpvotes: 400,
      following: 10,
      followers: 100,
      bio:
          "An enqusitic art lover with passion for illustration and minimilaistic designs.",
      displayName: 'Fahad Javed',
      email: 'fahad.javed@example.com',
      profileImageUrl: '',
      createdAt: DateTime.now(),
      lastActiveAt: DateTime.now(),
    );
  }

  Future<void> updateBio(String id, String bio) async {}
}
