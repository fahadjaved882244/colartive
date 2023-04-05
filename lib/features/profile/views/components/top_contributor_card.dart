import 'package:colartive2/extensions/async_value_x.dart';
import 'package:colartive2/extensions/base_state_x.dart';
import 'package:colartive2/extensions/string_x.dart';
import 'package:colartive2/features/profile/views/contributor_profile/contributor_profile_controller.dart';
import 'package:colartive2/utils/components/widgets/custom_image_view.dart';

import '../../../../core_packages.dart';
import '../../model/app_user.dart';

class TopContributorCard extends ConsumerWidget {
  const TopContributorCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(fetchTopContributorListProvider);
    return state.defaultWhen(
      data: (base) => base.defaultWhen(
        data: (users) => Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextButton(
              child: Text(
                "${AppStrings.contributor.tr(context)} ${AppStrings.leaderboard.tr(context)}",
              ),
              onPressed: () {},
            ),
            SizedBox(
              height: 100,
              child: Row(
                children: [
                  Flexible(
                    flex: 3,
                    child: topContributorThumbnail(context, users[0]),
                  ),
                  const SizedBox(width: Paddings.xs),
                  Flexible(
                    flex: 2,
                    child: topContributorThumbnail(context, users[0]),
                  ),
                  const SizedBox(width: Paddings.xs),
                  Flexible(
                    flex: 1,
                    child: topContributorThumbnail(context, users[0]),
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   height: AvatarRadius.md,
            //   child: ListView.separated(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: users.length,
            //     itemBuilder: (context, index) {
            //       final user = users[index];
            //       return Column(
            //         children: [
            //           AvatarImagePicker(
            //             title: user.name,
            //             photoUrl: user.photoUrl,
            //             radius: AvatarRadius.sm,
            //           ),
            //           const SizedBox(height: Paddings.xs / 2),
            //           Text(users[index].name, maxLines: 1),
            //         ],
            //       );
            //     },
            //     separatorBuilder: (context, _) =>
            //         const SizedBox(width: Paddings.sm),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  InkWell topContributorThumbnail(BuildContext context, AppUser user) {
    return InkWell(
      onTap: () => context.pushNamed(
        RouteNames.contributorProfile,
        params: {"userId": user.id},
      ),
      child: CustomImageView(
        title: user.name,
        imagePath: user.photoUrl,
      ),
    );
  }
}
