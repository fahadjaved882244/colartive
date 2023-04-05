import 'dart:typed_data';

import 'package:colartive2/extensions/base_state_x.dart';
import 'package:colartive2/features/auth/views/auth_controller.dart';
import 'package:colartive2/features/auth/views/update_account/update_profile/update_profile_controller.dart';
import 'package:colartive2/utils/components/widgets/avatar_image_picker.dart';
import 'package:colartive2/utils/state/base_state.dart';

import '../../../../../../core_packages.dart';

class UpdateUserImage extends ConsumerWidget {
  const UpdateUserImage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(authControllerProvider);
    final state = ref.watch(updateUserImageControllerProvider);

    ref.listen<BaseState>(
      updateUserImageControllerProvider,
      (_, next) => next.showError(context),
    );

    return userState.fold(
      () => const CircularProgressIndicator(),
      (user) => Column(
        children: [
          AvatarImagePicker(
            title: user.name,
            photoUrl: user.photoUrl,
            radius: AvatarRadius.lg,
            canPick: true,
            onPressed: () async => await ref
                .read(updateUserImageControllerProvider.notifier)
                .pickImage(),
            isLoading: state.isLoading,
            photoData: state.whenOrNull<Uint8List?>(data: (bytes) => bytes),
          ),
          const SizedBox(height: Paddings.sm),
          FittedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Paddings.md),
              child: Text(
                user.name,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
          Text(
            user.email,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
