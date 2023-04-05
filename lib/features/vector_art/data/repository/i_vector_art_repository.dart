import 'package:colartive2/features/vector_art/model/vector_art.dart';
import 'package:colartive2/features/vector_art/model/vector_art_wrapper.dart';

import '../../model/base_models/vector_scaffold.dart';
import '../../model/base_models/vector_skin.dart';

abstract class IVectorArtRepository {
  Future<List<VectorArtWrapper>> fetchVectorArtWrapperList();
  Future<VectorArt> fetchVectorArt(VectorArtWrapper wrapper);
  Future<VectorScaffold> fetchVectorScaffold(String id);
  Future<List<VectorSkin>> fetchVectorSkinOrDefault(String? id);
}
