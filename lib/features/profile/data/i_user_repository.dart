import 'package:colartive2/utils/error/app_error.dart';
import 'package:fpdart/fpdart.dart';

import '../model/app_user.dart';

abstract class IUserRepository {
  TaskEither<AppError, AppUser> insert(AppUser appUser);

  TaskEither<AppError, AppUser> fetch(String id);

  TaskEither<AppError, List<AppUser>> fetchTop();

  TaskEither<AppError, Unit> update(String id, Map<String, Object?> data);
}
