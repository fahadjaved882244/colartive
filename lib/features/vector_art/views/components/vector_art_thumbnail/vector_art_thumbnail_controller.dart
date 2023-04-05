import 'package:colartive2/features/vector_art/model/vector_art.dart';
import 'package:colartive2/features/vector_art/model/vector_art_wrapper.dart';
import 'package:colartive2/features/vector_art/views/home/home_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'vector_art_thumbnail_controller.g.dart';

@riverpod
Future<VectorArt> vectorArtThumbnailController(
  VectorArtThumbnailControllerRef ref, {
  required VectorArtWrapper wrapper,
}) {
  return ref.watch(vectorArtRepoProvider).fetchVectorArt(wrapper);
}
