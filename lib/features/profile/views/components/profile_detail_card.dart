import 'package:colartive2/extensions/context_x.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../utils/components/widgets/avatar_image_picker.dart';
import '../../../../utils/components/widgets/expandable_text.dart';
import '../../../../utils/core/app_sizes.dart';
import '../../model/app_user.dart';

class ProfileDetailCard extends StatelessWidget {
  final AppUser user;
  const ProfileDetailCard({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AvatarImagePicker(
              title: user.name,
              photoUrl: user.photoUrl,
            ),
            countSection(
              context: context,
              count: user.contributions,
              title: "Contributions",
            ),
            countSection(
              context: context,
              count: 25000,
              title: "Upvotes",
            ),
            countSection(
              context: context,
              count: user.followers,
              title: "Following",
            ),
          ],
        ),
        const SizedBox(height: Paddings.sm),
        Text(
          user.name,
          style: context.textTheme.titleMedium,
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 256),
          child: ExpandableText(
            user.bio ?? 'add your bio...',
            trimLines: 1,
            style: context.textTheme.bodyMedium
                ?.copyWith(color: context.colors.onSurfaceVariant),
          ),
        ),
      ],
    );
  }

  Column countSection({
    required BuildContext context,
    required int count,
    required String title,
  }) {
    return Column(
      children: [
        Text(
          NumberFormat.compact().format(count),
          style: context.textTheme.headlineLarge?.copyWith(
            color: context.colors.tertiary,
          ),
        ),
        Text(
          title,
          style: context.textTheme.titleSmall
              ?.copyWith(color: context.colors.onSurfaceVariant),
        ),
      ],
    );
  }
}
