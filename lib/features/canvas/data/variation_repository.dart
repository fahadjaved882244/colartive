import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colartive2/extensions/firebase_x.dart';
import 'package:colartive2/features/auth/model/app_user.dart';
import 'package:colartive2/features/canvas/data/i_variation_repository.dart';
import 'package:colartive2/features/canvas/model/shared_variation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final variationRepositoryProvider = Provider<IVariationRepository>((ref) {
  return VariationRepository();
});

class VariationRepository implements IVariationRepository {
  final _firestore = FirebaseFirestore.instance;
  @override
  Future<List<SharedVariation>> getAll() {
    return _firestore.variationCollection
        .where('isPublic', isEqualTo: true)
        .get()
        .then((querySnapshot) {
      return querySnapshot.docs
          .map((doc) => SharedVariation.fromMap(doc.data()))
          .toList();
    });
  }

  @override
  Future<SharedVariation> get(String id) {
    return _firestore.variationCollection.doc(id).get().then((doc) {
      if (doc.exists) {
        return SharedVariation.fromMap(doc.data()!);
      } else {
        throw Exception("Variation not found");
      }
    });
  }

  @override
  Future<void> add(SharedVariation variation) async {
    await _firestore.runTransaction((transaction) async {
      // Add the variation
      transaction.set(
        _firestore.variationCollection.doc(variation.id),
        variation.toMap(),
      );

      // Increment user's contribution count
      transaction.update(
        _firestore.userCollection.doc(variation.userId),
        {AppUser.contributionsField: FieldValue.increment(1)},
      );
    });
  }

  @override
  Future<void> update(String id, SharedVariation variation) {
    // TODO: implement updateVariation
    throw UnimplementedError();
  }

  @override
  Future<void> delete(String id) {
    // TODO: implement deleteVariation
    throw UnimplementedError();
  }
}
