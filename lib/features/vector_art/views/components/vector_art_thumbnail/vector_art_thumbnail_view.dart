import 'package:colartive2/core_packages.dart';
import 'package:colartive2/extensions/async_value_x.dart';
import 'package:colartive2/features/vector_art/model/vector_art.dart';
import 'package:colartive2/features/vector_art/model/vector_art_wrapper.dart';
import 'package:colartive2/features/vector_art/views/components/vector_art_painter/vector_art_painter.dart';
import 'package:colartive2/features/vector_art/views/components/vector_art_thumbnail/vector_art_thumbnail_controller.dart';
import 'package:colartive2/utils/logger/app_logger.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class VectorArtThumbnailView extends ConsumerWidget {
  final VectorArtWrapper wrapper;
  const VectorArtThumbnailView(this.wrapper, {super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state =
        ref.watch(vectorArtThumbnailControllerProvider(wrapper: wrapper));
    AppLogger.wtf("child created");

    return Card(
      clipBehavior: Clip.hardEdge,
      child: state.defaultWhen(
        data: (vector) => _VectorThumbnailCanvas(vector),
      ),
    );
  }
}

class _VectorThumbnailCanvas extends HookWidget {
  final VectorArt vectorArt;

  const _VectorThumbnailCanvas(this.vectorArt);
  @override
  Widget build(BuildContext context) {
    final index = useState(0);
    AppLogger.w("child updated - ${vectorArt.scaffold.name}");

    return GestureDetector(
      onDoubleTap: () {
        if (index.value >= vectorArt.skins.length - 1) {
          index.value = 0;
        } else {
          index.value++;
        }
      },
      child: CustomPaint(
        painter: VectorArtPainter(
          repaint: index,
          vectorScaffold: vectorArt.scaffold,
          vectorSkin: vectorArt.skins[index.value],
        ),
        child: const SizedBox.expand(),
      ),
    );
  }
}
