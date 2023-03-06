import 'package:cloud_firestore/cloud_firestore.dart';

extension FirestoreX on FirebaseFirestore {
  // DocumentReference<Map<String, dynamic>> get userDoc {
  //   final user = FirebaseAuth.instance.currentUser!;
  //   return collection('user').doc(user.uid);
  // }

  CollectionReference<Map<String, dynamic>> get userCollection =>
      collection('user');

  CollectionReference<Map<String, dynamic>> get restaurantCollection =>
      collection('restaurant');

  CollectionReference<Map<String, dynamic>> get butcherCollection =>
      collection('butcher');
}

extension DocumentReferenceX on DocumentReference {
  CollectionReference<Map<String, dynamic>> get addressCollection =>
      collection("address");
  CollectionReference<Map<String, dynamic>> get couponCollection =>
      collection("coupon");
}
