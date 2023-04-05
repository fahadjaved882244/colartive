import 'package:colartive2/extensions/async_value_x.dart';

import '../../../../core_packages.dart';
import '../../../../utils/components/scaffolds/sliver_base_scaffold.dart';
import '../../../profile/views/components/top_contributor_card.dart';
import '../components/vector_art_grid/vector_art_grid_view.dart';
import '../home/home_controller.dart';

class ShowCaseView extends ConsumerWidget {
  const ShowCaseView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeControllerProvider);

    return SliverBaseScaffold(
      title: AppStrings.showCase,
      header: const TopContributorCard(),
      sliver: state.defaultWhenSliver(
        data: (wrappers) => VectorArtGridView(wrappers: wrappers),
      ),
    );
  }
}
