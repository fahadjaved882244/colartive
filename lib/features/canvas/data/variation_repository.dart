import 'package:colartive2/features/canvas/data/i_variation_repository.dart';
import 'package:colartive2/features/canvas/model/shared_variation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final variationRepositoryProvider = Provider<IVariationRepository>((ref) {
  return VariationRepository();
});

class VariationRepository implements IVariationRepository {
  @override
  Future<List<SharedVariation>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<SharedVariation> get(String id) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<void> add(SharedVariation variation) {
    // TODO: implement addVariation
    throw UnimplementedError();
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
