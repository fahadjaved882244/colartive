import 'dart:typed_data';

import 'package:colartive2/core_packages.dart';
import '../buttons/custom_icon_button.dart';

class AvatarImagePicker extends StatelessWidget {
  final String? title;
  final Uint8List? photoData;
  final String? photoUrl;
  final double radius;
  final bool isLoading;
  final bool canPick;
  final void Function()? onPressed;
  const AvatarImagePicker({
    Key? key,
    this.photoData,
    this.photoUrl,
    this.title,
    this.onPressed,
    this.radius = AvatarRadius.md,
    this.isLoading = false,
    this.canPick = false,
  })  : assert(
          !canPick || (canPick && onPressed != null),
          "must pass onPressed Callback if canPick == true",
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: radius,
          backgroundColor: context.colors.tertiaryContainer,
          child: isLoading
              ? const CircularProgressIndicator()
              : photoData != null
                  ? Image.memory(
                      photoData!,
                      height: double.maxFinite,
                      width: double.maxFinite,
                      fit: BoxFit.contain,
                      errorBuilder: _errorBuilder,
                    )
                  : photoUrl != null
                      ? FadeInImage.assetNetwork(
                          image: photoUrl!,
                          height: radius,
                          width: radius,
                          fit: BoxFit.contain,
                          fadeInDuration: const Duration(milliseconds: 150),
                          placeholder: 'assets/general/placeholder.png',
                          imageErrorBuilder: _errorBuilder,
                        )
                      : title != null
                          ? Text(
                              title![0].toUpperCase(),
                              style: context.textTheme.headlineLarge?.copyWith(
                                color: context.colors.tertiary,
                                fontSize: radius * 0.70,
                              ),
                            )
                          : Image.asset(
                              'assets/general/placeholder.png',
                              height: radius,
                              width: radius,
                              fit: BoxFit.cover,
                            ),
        ),
        if (canPick && onPressed != null)
          CustomIconButton(
            backgroundColor: context.colors.primary,
            icon: Icon(
              Icons.edit,
              size: IconSizes.sm,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            onPressed: onPressed,
          ),
      ],
    );
  }

  DecoratedBox _errorBuilder(BuildContext context, Object o, StackTrace? st) {
    return DecoratedBox(
      decoration: BoxDecoration(color: context.colors.errorContainer),
      child: Image.asset(
        'assets/general/error.png',
        height: double.maxFinite,
        width: double.maxFinite,
        color: context.colors.error,
        fit: BoxFit.cover,
      ),
    );
  }
}
