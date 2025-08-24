import 'package:colartive2/features/auth/views/auth_controller.dart';
import 'package:colartive2/utils/core/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../../../utils/components/widgets/avatar_image_text.dart';

class UpdateUserImage extends ConsumerWidget {
  const UpdateUserImage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateProvider);

    if (user != null) {
      return Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              AvatarImageText(
                name: user.name ?? 'C',
                photoUrl: user.imageUrl,
                radius: 65,
              ),
              IconButton.filled(
                icon: Icon(
                  Icons.edit,
                  size: IconSizes.sm,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: Paddings.xs),
          FittedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Paddings.md),
              child: Text(
                user.name ?? '',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            user.email,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      );
    } else {
      return const SizedBox();
    }
  }
}
