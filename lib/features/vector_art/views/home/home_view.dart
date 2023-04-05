import 'package:colartive2/core_packages.dart';
import 'package:colartive2/extensions/async_value_x.dart';
import 'package:colartive2/features/profile/views/components/top_artist_card.dart';
import 'package:colartive2/features/vector_art/views/components/vector_art_grid/vector_art_grid_view.dart';
import 'package:colartive2/features/vector_art/views/home/home_controller.dart';
import 'package:colartive2/utils/components/scaffolds/sliver_base_scaffold.dart';
import 'package:colartive2/utils/logger/app_logger.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeControllerProvider);
    AppLogger.i("GridView - Updated");

    return SliverBaseScaffold(
      title: "ColArtive",
      header: const TopArtistCard(),
      sliver: state.defaultWhenSliver(
        data: (wrappers) => VectorArtGridView(wrappers: wrappers),
      ),
    );
  }
}

// class MyPainter extends CustomPainter {
//   MyPainter();
//   final Paint _paint = Paint()..color = AppColors.blue;

//   @override
//   void paint(Canvas canvas, Size size) {
//     final center = Offset(size.width / 2, size.height / 2);
//     final vertices = Vertices(
//       VertexMode.triangles,
//       [
//         center,
//         center + const Offset(200, 0),
//         center + const Offset(200, 200),
//         center + const Offset(0, 200),
//       ],
//       colors: [
//         AppColors.blue,
//         AppColors.blue,
//         AppColors.blue,
//         AppColors.blue,
//       ],
//       indices: [0, 1, 2, 1, 2, 3],
//     );
//     canvas.drawVertices(vertices, BlendMode.dst, _paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => true;
// }
