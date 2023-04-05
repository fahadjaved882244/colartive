import 'package:colartive2/features/vector_art/data/repository/i_vector_art_repository.dart';
import 'package:colartive2/features/vector_art/model/base_models/vector_scaffold.dart';
import 'package:colartive2/features/vector_art/model/base_models/vector_skin.dart';
import 'package:colartive2/features/vector_art/model/vector_art_wrapper.dart';
import 'package:colartive2/features/vector_art/model/vector_art.dart';
import 'package:colartive2/utils/core/app_sizes.dart';

import '../fake_db/fake_vector_art_db.dart';

class MockVectorArtRepository implements IVectorArtRepository {
  @override
  Future<List<VectorArtWrapper>> fetchVectorArtWrapperList() async {
    await Future.delayed(AppTimes.xs);
    return FakeVectorArtWrapperFactory().generateFakeList(length: 20);
  }

  @override
  Future<VectorArt> fetchVectorArt(VectorArtWrapper wrapper) async {
    final result = VectorArt(
      scaffold: await fetchVectorScaffold(wrapper.scaffoldId),
      skins: await fetchVectorSkinOrDefault(wrapper.skinId),
    );
    return result;
  }

  @override
  Future<VectorScaffold> fetchVectorScaffold(String id) async {
    await Future.delayed(AppTimes.xs);
    return FakeVectorScaffoldFactory().generateFake();
  }

  @override
  Future<List<VectorSkin>> fetchVectorSkinOrDefault(String? id) async {
    await Future.delayed(AppTimes.xs);
    if (id != null) {
      return [FakeVectorSkinFactory().generateFake()];
    } else {
      return FakeVectorSkinFactory().generateFakeList(length: 4);
    }
  }
}
