import 'package:colartive2/extensions/async_value_x.dart';
import 'package:colartive2/extensions/base_state_x.dart';
import 'package:colartive2/features/auth/views/auth_controller.dart';
import 'package:colartive2/features/profile/views/user_profile/user_profile_controller.dart';
import 'package:colartive2/features/vector_art/views/components/vector_art_grid/vector_art_grid_view.dart';
import 'package:colartive2/utils/components/buttons/custom_filled_button.dart';
import 'package:colartive2/utils/components/scaffolds/sliver_base_scaffold.dart';

import '../../../../core_packages.dart';
import '../../../../utils/state/base_state.dart';
import '../../../vector_art/views/home/home_controller.dart';
import '../components/profile_detail_card.dart';

class UserProfileView extends ConsumerWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authControllerProvider);
    final state = ref.watch(homeControllerProvider);

    return user.fold(
      () => const Center(child: CircularProgressIndicator()),
      (user) {
        return SliverBaseScaffold(
          title: AppStrings.profile,
          header: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileDetailCard(user: user),
              const SizedBox(height: Paddings.sm),
              const UserProfileButtonSection(),
            ],
          ),
          sliver: state.defaultWhenSliver(
            data: (value) => const VectorArtGridView(wrappers: []),
          ),
        );
      },
    );
  }
}

class UserProfileButtonSection extends ConsumerWidget {
  const UserProfileButtonSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(userProfileControllerProvider);

    ref.listen<BaseState>(
      userProfileControllerProvider,
      (_, next) {
        next.showError(context);
      },
    );
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: AppSizes.maxWidth),
      child: Row(
        children: [
          Expanded(
            child: CustomFilledButton(
              heightScale: 0.65,
              isTonal: true,
              text: AppStrings.editAcc,
              onPressed: () => context.goNamed(RouteNames.updateProfile),
            ),
          ),
          const SizedBox(width: Paddings.sm),
          Expanded(
            child: state.maybeWhen(
              orElse: () => CustomFilledButton(
                heightScale: 0.65,
                text: "Become an Artist",
                onPressed: () => ref
                    .read(userProfileControllerProvider.notifier)
                    .verifyEmail(),
              ),
              loading: () => const CustomFilledButton(
                heightScale: 0.65,
                onPressed: null,
                child: CircularProgressIndicator.adaptive(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
