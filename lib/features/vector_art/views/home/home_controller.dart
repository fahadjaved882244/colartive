import 'package:colartive2/features/vector_art/data/repository/i_vector_art_repository.dart';
import 'package:colartive2/features/vector_art/data/repository/mock_vector_art_repository.dart';
import 'package:colartive2/features/vector_art/model/vector_art_wrapper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_controller.g.dart';

final vectorArtRepoProvider = Provider.autoDispose<IVectorArtRepository>((ref) {
  return MockVectorArtRepository();
});

@riverpod
class HomeController extends _$HomeController {
  @override
  FutureOr<List<VectorArtWrapper>> build() async {
    return ref.read(vectorArtRepoProvider).fetchVectorArtWrapperList();
  }
}
