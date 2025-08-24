import 'package:colartive2/features/canvas/model/shared_variation.dart';

abstract class IVariationRepository {
  Future<List<SharedVariation>> getAll();
  Future<void> addVariation(SharedVariation variation);
  Future<void> deleteVariation(String id);
  Future<void> updateVariation(String id, SharedVariation variation);
}
