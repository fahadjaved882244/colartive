import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colartive2/extensions/firebase_x.dart';

import '../../../model/app_user.dart';
import 'i_user_repository.dart';

class UserRepository implements IUserRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> create(AppUser userModel) {
    return _firestore.userCollection.doc(userModel.id).set(userModel.toMap());
  }

  @override
  Future<AppUser?> read(String id) async {
    final doc = await _firestore.userCollection.doc(id).get();
    if (doc.data() != null) {
      return AppUser.fromMap(doc.data()!);
    }
    return null;
  }

  @override
  Future<void> update(String uid, Map<String, dynamic> data) {
    return _firestore.userCollection.doc(uid).update(data);
  }

  @override
  Future<void> delete(String uid) {
    return _firestore.userCollection.doc(uid).delete();
  }

  @override
  Future<bool> uploadProfileImage(String userId, File image) {
    throw UnimplementedError();
  }
}
