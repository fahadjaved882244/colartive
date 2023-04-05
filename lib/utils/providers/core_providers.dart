import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colartive2/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider =
    Provider.autoDispose<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final flavorProvider = Provider<AppFlavor>((ref) {
  throw UnimplementedError();
});

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final firestoreProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});

final firebaseStorageProvider = Provider<FirebaseStorage>((ref) {
  return FirebaseStorage.instance;
});

final googleSignInProvider = Provider<GoogleSignIn>((ref) {
  return GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
});
