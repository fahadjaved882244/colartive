import 'dart:io';

import 'package:colartive2/features/auth/model/app_user.dart';

abstract class IUserRepository {
  Future<void> create(AppUser userModel);

  Future<AppUser?> read(String id);

  Future<void> update(String uid, Map<String, dynamic> data);

  Future<void> delete(String uid);

  Future<bool> uploadProfileImage(String userId, File image);
}
