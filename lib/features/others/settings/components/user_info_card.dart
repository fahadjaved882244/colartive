import '../../../auth/views/auth_controller.dart';
import '../../../../core_packages.dart';
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
        onTap: () => isLoggedIn
            ? context.go(Uri(path: AppPaths.userProfile, queryParameters: {
                'id': user.id,
                'name': user.name,
                'photoUrl': user.photoUrl
              }).toString())
            : context.go(AppPaths.login),
      ),
    );
  }
}
