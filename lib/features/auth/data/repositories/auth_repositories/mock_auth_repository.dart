import 'dart:io';
import '../../../../../utils/core/app_sizes.dart';
import '../../../model/app_user.dart';
import '../../utils/auth_exceptions.dart';
import 'i_auth_repository.dart';

class MockAuthRepository implements IAuthRepository {
  @override
  AppUser? get currentUser => null;

  @override
  Future<void> changePassword(
      {required String oldPassword, required String newPassword}) {
    throw UnimplementedError();
  }

  @override
  Future<void> externalSignIn(authCred) {
    throw UnimplementedError();
  }

  @override
  Future<void> forgotPassword(String email) async {
    await Future.delayed(AppTimes.xs);
    throw NoUserFoundException(code: "320");
  }

  @override
  Future<AppUser?> login(
      {required String email, required String password}) async {
    await Future.delayed(AppTimes.sl);
    throw CredentialException(code: "320");
  }

  @override
  Future<void> signOut() {
    throw UnimplementedError();
  }

  @override
  Future<AppUser?> signup(
      {required String email,
      required String password,
      required Map<String, dynamic> body}) async {
    await Future.delayed(AppTimes.sl);
    throw EmailInUseException(code: "320");
  }

  @override
  Future<void> updateEmail(
      {required String newEmail, required String password}) {
    throw UnimplementedError();
  }

  @override
  Future<bool> verifyEmail() {
    throw UnimplementedError();
  }

  @override
  Stream<AppUser?> get authStateChange async* {
    await Future.delayed(AppTimes.xs);
    yield AppUser(
      id: 'qeqweqweqweqwe',
      email: 'fahad@gmail.com',
      name: 'Muhammad fahad Javed',
      createdAt: DateTime.now(),
      lastActiveAt: DateTime.now(),
    );
    // throw UnimplementedError();
  }

  @override
  Future<bool> uploadProfileImage(File profileImage) {
    throw UnimplementedError();
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

  @override
  Future<String?> updateName(String name) {
    throw UnimplementedError();
  }
}
