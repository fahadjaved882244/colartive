import 'package:colartive2/features/canvas/model/shared_variation.dart';

abstract class IVariationRepository {
  Future<List<SharedVariation>> getAll();
  Future<SharedVariation> get(String id);
  Future<void> add(SharedVariation variation);
  Future<void> update(String id, SharedVariation variation);
  Future<void> delete(String id);
}
