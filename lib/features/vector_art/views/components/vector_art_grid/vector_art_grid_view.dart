import 'package:colartive2/features/vector_art/model/vector_art_wrapper.dart';
import 'package:flutter/widgets.dart';

import '../../../../../utils/core/app_sizes.dart';
import '../vector_art_thumbnail/vector_art_thumbnail_view.dart';

class VectorArtGridView extends StatelessWidget {
  final List<VectorArtWrapper> wrappers;

  const VectorArtGridView({super.key, required this.wrappers});

  @override
  Widget build(BuildContext context) {
    if (wrappers.isNotEmpty) {
      return SliverPadding(
        padding: const EdgeInsets.all(Paddings.xs),
        sliver: SliverGrid.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 320,
            childAspectRatio: 0.5,
          ),
          itemCount: wrappers.length,
          itemBuilder: (_, index) => VectorArtThumbnailView(wrappers[index]),
        ),
      );
    } else {
      return const SliverFillRemaining(
        child: Center(
          child: Text("No art to show!"),
        ),
      );
    }
  }
}
