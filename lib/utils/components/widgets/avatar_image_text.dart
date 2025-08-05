import 'package:colartive2/extensions/context_x.dart';
import 'package:colartive2/utils/core/app_sizes.dart';
import 'package:flutter/material.dart';

import 'custom_image_view.dart';

class AvatarImageText extends StatelessWidget {
  final String name;
  final String? photoUrl;
  final double? radius;
  final BoxBorder? border;
  const AvatarImageText({
    super.key,
    required this.name,
    required this.photoUrl,
    this.radius,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    final double radiusX = radius ?? AvatarRadius.md;

    return SizedBox(
      height: radiusX * 2,
      width: radiusX * 2,
      child: CircleAvatar(
        radius: radiusX,
        backgroundColor: context.colors.tertiaryContainer,
        child: ClipOval(
          child: photoUrl != null
              ? CustomImageView(
                  imagePath: photoUrl!,
                )
              : Text(
                  name[0].toUpperCase(),
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: context.colors.tertiary,
                        fontSize: radiusX * 1,
                      ),
                ),
        ),
      ),
    );
  }
}
