import 'package:colartive2/extensions/context_x.dart';
import 'package:colartive2/features/profile/views/profile_controller.dart';
import 'package:colartive2/routes/app_paths.dart';
import 'package:colartive2/utils/components/scaffolds/base_scaffold.dart';
import 'package:colartive2/utils/components/widgets/avatar_image_text.dart';
import 'package:colartive2/utils/core/app_colors.dart';
import 'package:colartive2/utils/core/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ionicons/ionicons.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: AppStrings.profile,
      actions: [
        IconButton(
          onPressed: () => context.go(AppPaths.updateProfile),
          icon: const Icon(Ionicons.settings_outline),
        ),
      ],
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: Consumer(
              builder: (context, ref, child) {
                return ref.watch(appUserStreamProvider('id')).when(
                      data: (user) => Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  AvatarImageText(
                                    name: user.displayName,
                                    photoUrl: user.profileImageUrl,
                                  ),
                                  Text(
                                    user.bio,
                                    style: context.textTheme.titleMedium,
                                  ),
                                ],
                              ),
                              Text(user.contributions.toString()),
                              Text(user.totalUpvotes.toString()),
                              Text(user.following.toString()),
                            ],
                          ),
                          Text(user.bio)
                        ],
                      ),
                      loading: () => const Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                      error: (error, _) =>
                          Center(child: Text(error.toString())),
                    );
              },
            ),
          ),
          Expanded(child: Container(color: AppColors.darkGray)),
        ],
      ),
    );
  }
}
