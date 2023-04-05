import 'dart:io';

import 'package:colartive2/features/auth/data/google_auth_repository.dart';
import 'package:colartive2/features/profile/data/i_user_repository.dart';

import 'package:colartive2/utils/error/app_error.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:colartive2/features/auth/data/auth_repository.dart';
import 'package:colartive2/features/auth/model/auth_user.dart';
import 'package:colartive2/features/profile/data/user_repository.dart';
import 'package:colartive2/features/profile/model/app_user.dart';

import '../data/i_auth_repository.dart';

final authServiceProvider = Provider(
  (ref) {
    final authRepo = ref.watch(authRepoProvider);
    final userRepo = ref.watch(userRepoProvider);
    final googleSignIn = ref.watch(googleAuthRepoProvider);
    return AuthService(authRepo, userRepo, googleSignIn);
  },
);

class AuthService {
  final IAuthRepository _authRepo;
  final IUserRepository _userRepo;
  final GoogleAuthRepository _googleAuthRepo;

  AuthService(
    this._authRepo,
    this._userRepo,
    this._googleAuthRepo,
  );

  Stream<bool> get authState {
    return _authRepo.authStateChange.map(
      (option) => option.fold(() => false, (t) => true),
    );
  }

  TaskEither<AppError, AppUser> signup({
    required String email,
    required String password,
    required String name,
  }) {
    return _authRepo
        .signup(email: email, password: password)
        .map((authUser) => authUser.toAppUser(false).copyWith(name: name))
        .flatMap((appUser) => _userRepo.insert(appUser));
  }

  TaskEither<AppError, AppUser> login({
    required String email,
    required String password,
  }) {
    return _authRepo
        .login(email: email, password: password)
        .flatMap((authUser) => _userRepo.fetch(authUser.id));
  }

  TaskEither<AppError, AppUser> googleSignIn() {
    return _googleAuthRepo
        .signInWithGoogle()
        .flatMap((cred) => _externalSignIn(cred));
  }

  TaskEither<AppError, AppUser> _externalSignIn(authCred) {
    return _authRepo.checkArtistClaim().flatMap((isArtist) {
      return _authRepo.externalSignIn(authCred).flatMap(
        (authUser) {
          return _userRepo
              .fetch(authUser.id)
              .orElse((l) => _userRepo.insert(authUser.toAppUser(isArtist)));
        },
      );
    });
  }

  TaskEither<AppError, Unit> resetPassword(String email) {
    return _authRepo.resetPassword(email);
  }

  TaskEither<AppError, Unit> updateEmail({
    required String newEmail,
    required String password,
    required String uid,
  }) {
    return _authRepo
        .updateEmail(newEmail: newEmail, password: password)
        .flatMap((r) => _userRepo.update(uid, {"email": newEmail}));
  }

  TaskEither<AppError, Unit> changePassword({
    required String oldPassword,
    required String newPassword,
  }) {
    return _authRepo.changePassword(
      oldPassword: oldPassword,
      newPassword: newPassword,
    );
  }

  TaskEither<AppError, Unit> signOut() {
    return _googleAuthRepo.signOut().flatMap((_) => _authRepo.signOut());
  }

  TaskEither<AppError, Unit> updateUserDetails({
    required String uid,
    required String name,
    required String bio,
  }) {
    return _userRepo.update(
      uid,
      {"name": name, "bio": bio},
    );
  }

  Future<bool> uploadProfileImage(File profileImage) {
    // TODO: implement uploadProfileImage
    throw UnimplementedError();
  }

  TaskEither<AppError, Unit> verifyEmail([Object? actionCodeSettings]) {
    return _authRepo.verifyEmail(actionCodeSettings);
  }

  Future<void> verifyPhone({
    required String phoneNumber,
    required void Function(dynamic authCred) verificationCompleted,
    required void Function(Exception p1) verificationFailed,
    required void Function(String p1, int? p2) codeSent,
    required void Function(String p1) codeAutoRetrievalTimeout,
  }) {
    return _authRepo.verifyPhone(
      phoneNumber: phoneNumber,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }
}

extension AppUserX on AuthUser {
  AppUser toAppUser(bool isArtist) {
    return AppUser(
      id: this.id,
      email: email,
      name: name ?? "",
      isVerified: isVerified,
      role: isArtist ? UserRole.artist : UserRole.contributor,
    );
  }
}
