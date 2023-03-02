import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colartive2/extensions/firebase_x.dart';

import '../model/auth_user.dart';

class UserRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> create(AuthUser userModel) async {
    await _firestore.userCollection.doc(userModel.id).set(userModel.toMap());
    return true;
  }

  Future<AuthUser?> read(String id) async {
    final doc = await _firestore.userCollection.doc(id).get();
    if (doc.data() != null) {
      return AuthUser.fromMap(doc.data()!);
    }
    return null;
  }

  Future<bool> update(AuthUser data) async {
    await _firestore.userCollection.doc(data.id).update(data.toMap());
    return true;
  }

  Future<bool> delete(String uid) async {
    await _firestore.userCollection.doc(uid).delete();
    return true;
  }

  Future<bool> uploadProfileImage(String userId, File profileImage) {
    throw UnimplementedError();
  }
}
