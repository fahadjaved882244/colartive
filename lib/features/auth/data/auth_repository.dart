import 'package:colartive2/utils/error/app_error.dart';
import 'package:colartive2/utils/error/map_auth_error.dart';
import 'package:colartive2/utils/providers/core_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../model/auth_user.dart';
import 'i_auth_repository.dart';

final authRepoProvider = Provider<IAuthRepository>((ref) {
  // return MockAuthRepository();
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  return AuthRepository(firebaseAuth);
});

class AuthRepository extends IAuthRepository {
  final FirebaseAuth _firebaseAuth;
  AuthRepository(this._firebaseAuth);

  @override
  Option<AuthUser> get currentUser => _firebaseAuth.currentUser.toAuthUser;

  @override
  Stream<Option<AuthUser>> get authStateChange =>
      _firebaseAuth.idTokenChanges().map((u) => u.toAuthUser);

  @override
  TaskEither<AppError, bool> checkArtistClaim() {
    return TaskEither.fromNullable(
      _firebaseAuth.currentUser,
      () => const AppError.unExpectedAuth(),
    )
        .flatMap(
          (user) => TaskEither.tryCatch(
            () => user.getIdTokenResult(),
            mapAuthError,
          ),
        )
        .chainEither(
          (token) => Either.fromNullable(
            token.claims,
            () => const AppError.unExpectedAuth(),
          ),
        )
        .chainEither(
          (claims) => Either.tryCatch(
            () => claims['artist'] as bool,
            mapAuthError,
          ),
        );
  }

  @override
  TaskEither<AppError, AuthUser> signup({
    required String email,
    required String password,
  }) {
    return TaskEither.tryCatch(
      () => _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ),
      mapAuthError,
    ).chainEither(
      (cred) => Either.fromOption(
        cred.user.toAuthUser,
        () => const AppError.unExpectedAuth(),
      ),
    );
  }

  @override
  TaskEither<AppError, AuthUser> login({
    required String email,
    required String password,
  }) {
    return TaskEither.tryCatch(
      () => _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      ),
      mapAuthError,
    ).chainEither(
      (cred) => Either.fromOption(
        cred.user.toAuthUser,
        () => const AppError.unExpectedAuth(),
      ),
    );
  }

  @override
  TaskEither<AppError, AuthUser> externalSignIn(authCred) {
    return TaskEither.tryCatch(
      () => _firebaseAuth.signInWithCredential(
        authCred as OAuthCredential,
      ),
      mapAuthError,
    ).chainEither(
      (cred) => Either.fromOption(
        cred.user.toAuthUser,
        () => const AppError.unExpectedAuth(),
      ),
    );
  }

  @override
  TaskEither<AppError, Unit> resetPassword(String email) {
    return TaskEither.tryCatch(
      () => _firebaseAuth.sendPasswordResetEmail(email: email),
      mapAuthError,
    ).map((r) => unit);
  }

  @override
  TaskEither<AppError, Unit> updateEmail({
    required String newEmail,
    required String password,
  }) {
    return _reAuthenticate(password)
        .flatMap(
          TaskEither.tryCatchK(
            (user) => user.updateEmail(newEmail),
            mapAuthError,
          ),
        )
        .map((r) => unit);
  }

  @override
  TaskEither<AppError, Unit> changePassword({
    required String oldPassword,
    required String newPassword,
  }) {
    return _reAuthenticate(oldPassword)
        .flatMap(
          TaskEither.tryCatchK(
            (user) => user.updatePassword(newPassword),
            mapAuthError,
          ),
        )
        .map((r) => unit);
  }

  @override
  TaskEither<AppError, Unit> verifyEmail([Object? actionCodeSettings]) {
    return Either.fromNullable(
      _firebaseAuth.currentUser,
      () => const AppError.unExpectedAuth(),
    )
        .toTaskEither()
        .flatMap(TaskEither.tryCatchK(
          (user) => user.sendEmailVerification(
            actionCodeSettings is ActionCodeSettings
                ? actionCodeSettings
                : null,
          ),
          (e, _) => const AppError.unExpectedAuth(),
        ))
        .map((r) => unit);
  }

  TaskEither<AppError, User> _reAuthenticate(String password) {
    final userOr = _firebaseAuth.currentUser;
    return Either.fromNullable(
      (userOr != null && userOr.email != null) ? userOr : null,
      () => const AppError.unExpectedAuth(),
    ).toTaskEither().flatMap(
          TaskEither.tryCatchK(
            (user) async {
              await user.reauthenticateWithCredential(
                EmailAuthProvider.credential(
                  email: user.email!,
                  password: password,
                ),
              );
              return user;
            },
            mapAuthError,
          ),
        );
  }

  @override
  TaskEither<AppError, Unit> signOut() {
    return TaskEither.tryCatch(() => _firebaseAuth.signOut(), mapAuthError)
        .map((_) => unit);
  }

  @override
  Future<void> verifyPhone(
      {required String phoneNumber,
      required void Function(dynamic authCred) verificationCompleted,
      required void Function(Exception p1) verificationFailed,
      required void Function(String p1, int? p2) codeSent,
      required void Function(String p1) codeAutoRetrievalTimeout}) {
    throw UnimplementedError();
  }
}

extension AppUserX on User? {
  Option<AuthUser> get toAuthUser {
    return Option.fromNullable(this)
        .flatMap(
            (user) => Option.fromNullable(user.email != null ? user : null))
        .map(
          (t) => AuthUser(
            id: t.uid,
            email: t.email!,
            name: t.displayName,
            isVerified: t.emailVerified,
            photoUrl: t.photoURL,
          ),
        );
  }
}
