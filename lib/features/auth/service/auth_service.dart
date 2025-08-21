import 'dart:io';

import '../data/repositories/auth_repositories/i_auth_repository.dart';
import '../data/repositories/user_repositories/i_user_repository.dart';

class AuthService {
  final IAuthRepository _authRepository;
  final IUserRepository _userRepository;
  AuthService(this._authRepository, this._userRepository);

  Future<void> signup({
    required String email,
    required String password,
    required Map<String, dynamic> body,
  }) {
    return _authRepository
        .signup(email: email, password: password, body: body)
        .then((user) {
      if (user != null) {
        _userRepository.create(user);
      }
    });
  }

  Future<void> login({required String email, required String password}) {
    return _authRepository.login(email: email, password: password).then((user) {
      if (user != null) {
        return _userRepository.update(
          user.id,
          {
            'isVerified': true,
            'lastActiveAt': user.lastActiveAt,
          },
        );
      }
    });
  }

  Future<void> updateEmail(
      {required String newEmail, required String password}) {
    return _authRepository.updateEmail(newEmail: newEmail, password: password);
  }

  Future<void> verifyEmail() {
    return _authRepository.verifyEmail();
  }

  Future<void> forgotPassword(String email) {
    return _authRepository.forgotPassword(email);
  }

  Future<void> changePassword(
      {required String oldPassword, required String newPassword}) {
    return _authRepository.changePassword(
      oldPassword: oldPassword,
      newPassword: newPassword,
    );
  }

  Future<void> updateDetails(String name, String bio) {
    return _authRepository.updateName(name).then((id) {
      if (id != null) {
        return _userRepository.update(id, {'bio': bio, 'name': name});
      }
    });
  }

  Future<bool> uploadProfileImage(File profileImage) {
    return _authRepository.uploadProfileImage(profileImage);
  }
}
