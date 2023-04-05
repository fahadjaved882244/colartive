import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colartive2/extensions/firebase_x.dart';
import 'package:colartive2/features/profile/data/i_user_repository.dart';
import 'package:colartive2/utils/error/app_error.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/providers/core_providers.dart';
import '../model/app_user.dart';

final userRepoProvider = Provider(
  (ref) {
    final firestore = ref.watch(firestoreProvider);
    return UserRepository(firestore);
  },
);

class UserRepository implements IUserRepository {
  final FirebaseFirestore _firestore;
  UserRepository(this._firestore);

  @override
  TaskEither<AppError, AppUser> insert(AppUser appUser) {
    return TaskEither.tryCatch(
      () => _firestore.userColl.doc(appUser.id).set(appUser.toMap()),
      (error, _) => const AppError.dbInsert(),
    ).map((r) => appUser);
  }

  @override
  TaskEither<AppError, AppUser> fetch(String id) {
    return TaskEither.tryCatch(
      () => _firestore.userColl.doc(id).get(),
      (error, _) => const AppError.dbFetch(),
    )
        .chainEither(
          (doc) => Either.fromNullable(
            doc.data(),
            () => const AppError.dbFetch(),
          ),
        )
        .map(
          (data) => AppUser.fromMap(data),
        );
  }

  @override
  TaskEither<AppError, List<AppUser>> fetchTop() {
    return TaskEither.tryCatch(
      () => _firestore.userColl.get(),
      (error, _) => const AppError.dbFetch(),
    ).map(
      (query) => query.docs.map((e) => AppUser.fromMap(e.data())).toList(),
    );
  }

  @override
  TaskEither<AppError, Unit> update(String id, Map<String, Object?> data) {
    return TaskEither.tryCatch(
      () => _firestore.userColl.doc(id).update(data),
      (error, _) => const AppError.dbUpdate(),
    ).map((r) => unit);
  }

  // Future<bool> delete(String uid) async {
  //   await _firestore.userCollection.doc(uid).delete();
  //   return true;
  // }
}
