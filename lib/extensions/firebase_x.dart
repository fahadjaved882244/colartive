import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

extension FirestoreX on FirebaseFirestore {
  DocumentReference<Map<String, dynamic>> get userDoc {
    final user = FirebaseAuth.instance.currentUser!;
    return collection('users').doc(user.uid);
  }

  DocumentReference<Map<String, dynamic>> addressDoc(String id) {
    return userDoc.addressCollection.doc(id);
  }

  CollectionReference<Map<String, dynamic>> get userCollection =>
      collection('users');

  CollectionReference<Map<String, dynamic>> get restaurantCollection =>
      collection('restaurant');

  CollectionReference<Map<String, dynamic>> get butcherCollection =>
      collection('butcher');
}

extension DocumentReferenceX on DocumentReference {
  CollectionReference<Map<String, dynamic>> get addressCollection =>
      collection("addresses");
  CollectionReference<Map<String, dynamic>> get couponCollection =>
      collection("coupons");
}
