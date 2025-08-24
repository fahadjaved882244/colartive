import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

extension FirestoreX on FirebaseFirestore {
  DocumentReference<Map<String, dynamic>> get userDoc {
    final user = FirebaseAuth.instance.currentUser!;
    return collection('users').doc(user.uid);
  }

  CollectionReference<Map<String, dynamic>> get userCollection =>
      collection('users');

  CollectionReference<Map<String, dynamic>> get templateCollection =>
      collection('templates');

  CollectionReference<Map<String, dynamic>> get variationCollection =>
      collection('variations');
}

extension DocumentReferenceX on DocumentReference {
  CollectionReference<Map<String, dynamic>> get addressCollection =>
      collection("address");
  CollectionReference<Map<String, dynamic>> get couponCollection =>
      collection("coupon");
}
