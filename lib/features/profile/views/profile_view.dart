import 'package:colartive2/routes/app_navigation.dart';
import 'package:colartive2/utils/components/scaffolds/base_scaffold.dart';
import 'package:colartive2/utils/components/widgets/avatar_image_text.dart';
import 'package:colartive2/utils/core/app_colors.dart';
import 'package:colartive2/utils/core/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ionicons/ionicons.dart';

import 'profile_controller.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: AppStrings.profile,
      actions: [
        IconButton(
          onPressed: () => context.goUpdateProfile(),
          icon: const Icon(Ionicons.settings_outline),
        ),
      ],
      child: Column(
        children: [
          SizedBox(
            height: 150,
            child: Consumer(
              builder: (context, ref, child) {
                return ref.watch(userProfileProvider).when(
                      data: (user) {
                        if (user == null) {
                          return Center(
                            child: Text('User not found'),
                          );
                        }
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AvatarImageText(
                                      name: user.name ?? 'C',
                                      photoUrl: user.imageUrl,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(user.name ?? 'Add a name'),
                                  ],
                                ),
                                headerSection(
                                    user.contributions, 'Contributions'),
                                headerSection(user.totalUpvotes, 'Upvotes'),
                                headerSection(user.followers, 'Followers'),
                              ],
                            ),
                            SizedBox(height: 8),
                            SizedBox(
                              height: 48,
                              child: Text(
                                user.bio ?? 'Add a bio',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
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

  Widget headerSection(int count, String name) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 64,
          child: Center(
            child: Text(
              count.toString(),
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(name),
      ],
    );
  }
}
