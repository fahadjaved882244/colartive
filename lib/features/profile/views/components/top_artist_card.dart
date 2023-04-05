import 'package:colartive2/extensions/async_value_x.dart';
import 'package:colartive2/extensions/base_state_x.dart';
import 'package:colartive2/extensions/string_x.dart';
import 'package:colartive2/features/profile/model/app_user.dart';
import 'package:colartive2/features/profile/views/artist_profile/artist_profile_controller.dart';
import 'package:colartive2/utils/components/widgets/custom_image_view.dart';

import '../../../../core_packages.dart';

class TopArtistCard extends ConsumerWidget {
  const TopArtistCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(fetchTopArtistListProvider);
    return state.defaultWhen(
      data: (base) => base.defaultWhen(
        data: (users) => Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextButton(
              child: Text(
                "${AppStrings.artist.tr(context)} ${AppStrings.leaderboard.tr(context)}",
              ),
              onPressed: () {},
            ),
            SizedBox(
              height: 100,
              child: Row(
                children: [
                  Flexible(
                    flex: 3,
                    child: topArtistThumbnail(context, users[0]),
                  ),
                  const SizedBox(width: Paddings.xs),
                  Flexible(
                    flex: 2,
                    child: topArtistThumbnail(context, users[1]),
                  ),
                  const SizedBox(width: Paddings.xs),
                  Flexible(
                    flex: 1,
                    child: topArtistThumbnail(context, users[2]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  InkWell topArtistThumbnail(BuildContext context, AppUser user) {
    return InkWell(
      onTap: () => context.goNamed(
        RouteNames.artistProfile,
        params: {"uid": user.id},
      ),
      child: CustomImageView(
        title: user.name,
        imagePath: user.photoUrl,
      ),
    );
  }
}
