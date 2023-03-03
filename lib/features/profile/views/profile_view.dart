import 'package:colartive2/features/profile/views/profile_controller.dart';
import 'package:colartive2/routes/app_router/app_router.dart';
import 'package:colartive2/utils/components/scaffolds/base_scaffold.dart';
import 'package:ionicons/ionicons.dart';

import '../../../core_packages.dart';

class ProfileView extends StatelessWidget {
  final String id;

  const ProfileView({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: AppStrings.profile,
      actions: [
        IconButton(
          onPressed: () => UpdateProfileRoute(id: id).go(context),
          icon: const Icon(Ionicons.settings_outline),
        ),
      ],
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: Consumer(
              builder: (context, ref, child) {
                return ref.watch(appUserStreamProvider(id)).when(
                      data: (user) => Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: const [
                                  // AvatarImageText(
                                  //   name: name,
                                  //   photoUrl: photoUrl,
                                  // ),
                                  // Text(
                                  //   name,
                                  //   style: context.textTheme.titleMedium,
                                  // ),
                                ],
                              ),
                              Text(user.contributions.toString()),
                              Text(user.upvotes.toString()),
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
