import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colartive2/extensions/firebase_x.dart';

import '../../modules/components/popups/custom_snackbar.dart';
import '../models/user.dart';

class UserProvider {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> create(UserModel userModel) async {
    try {
      await _firestore.userCollection.doc(userModel.id).set(userModel.toMap());
      return true;
    } on Exception catch (e) {
      showCustomSnackBar("Create_User: $e", isError: true);
      return false;
    }
  }

  Future<UserModel?> read(String uid) async {
    try {
      UserModel? userX;
      final doc = await _firestore.userCollection.doc(uid).get();
      if (doc.data() != null) {
        userX = UserModel.fromMap(doc.data()!);
      }
      return userX;
    } on Exception catch (e) {
      showCustomSnackBar("Read_User: $e", isError: true);
      return null;
    }
  }

  Stream<UserModel?> watch(String uid) async* {
    try {
      final docs = _firestore.userCollection.doc(uid).snapshots();
      yield* docs.map((doc) {
        if (doc.data() != null) {
          return UserModel.fromMap(doc.data()!);
        }
        return null;
      });
    } on Exception catch (e) {
      showCustomSnackBar("Watch_User: $e", isError: true);
    }
  }

  Future<bool> update(String id, Map<String, Object?> data) async {
    try {
      await _firestore.userCollection.doc(id).update(data);
      return true;
    } on Exception catch (e) {
      showCustomSnackBar("Update_User: $e", isError: true);
      return false;
    }
  }

  Future<bool> delete(String uid) async {
    try {
      await _firestore.userCollection.doc(uid).delete();
      return true;
    } on Exception catch (e) {
      showCustomSnackBar("Delete_User: $e", isError: true);
      return false;
    }
  }

  Future<String?> getToken(String uid) async {
    final doc = await _firestore.collection("UserTokens").doc(uid).get();
    final data = doc.data();
    if (data != null) {
      return (data.values.elementAt(0) as String);
    }
    return null;
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> userSnapshot() {
    return _firestore.userDoc.snapshots();
  }
}
