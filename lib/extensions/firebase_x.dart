import 'package:cloud_firestore/cloud_firestore.dart';

extension FirestoreX on FirebaseFirestore {
  // DocumentReference<Map<String, dynamic>> get userDoc {
  //   final user = FirebaseAuth.instance.currentUser!;
  //   return collection('user').doc(user.uid);
  // }

  CollectionReference<Map<String, dynamic>> get userColl => collection('user');

  CollectionReference<Map<String, dynamic>> get artistColl =>
      collection('artist');

  CollectionReference<Map<String, dynamic>> get vectorColl =>
      collection('vector');
}

extension DocumentReferenceX on DocumentReference {
  CollectionReference<Map<String, dynamic>> get contributionColl =>
      collection("contribution");

  CollectionReference<Map<String, dynamic>> get artColl => collection("art");

  CollectionReference<Map<String, dynamic>> get defaultColl =>
      collection("default");
}
