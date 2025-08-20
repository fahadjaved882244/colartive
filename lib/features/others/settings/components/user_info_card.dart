import 'package:colartive2/routes/app_navigation.dart';
import 'package:colartive2/utils/core/app_colors.dart';
import 'package:colartive2/utils/core/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../auth/views/auth_controller.dart';
import '../../../../utils/components/cards/custom_outlined_card.dart';
import '../../../../utils/components/widgets/custom_list_tile.dart';

class UserInfoCard extends ConsumerWidget {
  const UserInfoCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateProvider);
    final isLoggedIn = user != null;
    return CustomOutlinedCard(
      outlineColor: AppColors.green,
      child: CustomListTile(
        leading: const Icon(
          Icons.account_circle_outlined,
          color: AppColors.green,
        ),
        title: isLoggedIn ? user.name : AppStrings.login,
        subtitle: isLoggedIn ? user.email : AppStrings.contribute,
        implyTrailing: true,
        onTap: () {
          context.goUserProfile();
        },
      ),
    );
  }
}
