import 'package:colartive2/extensions/async_value_x.dart';
import 'package:colartive2/extensions/base_state_x.dart';
import 'package:colartive2/features/profile/views/contributor_profile/contributor_profile_controller.dart';
import 'package:colartive2/features/vector_art/views/components/vector_art_grid/vector_art_grid_view.dart';
import 'package:colartive2/utils/components/scaffolds/sliver_base_scaffold.dart';

import '../../../../core_packages.dart';
import '../components/profile_detail_card.dart';

class ContributorProfileView extends ConsumerWidget {
  final String uid;
  const ContributorProfileView(this.uid, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(fetchContributorProvider(uid));
    return SliverBaseScaffold(
      title: AppStrings.contribute,
      header: asyncState.defaultWhen(
        data: (state) => state.defaultWhen(
          data: (user) => ProfileDetailCard(user: user),
        ),
      ),
      sliver: const VectorArtGridView(wrappers: []),
    );
  }
}
