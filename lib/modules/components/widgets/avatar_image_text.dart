import 'package:flutter/material.dart';

import 'custom_image_view.dart';

class AvatarImageText extends StatelessWidget {
  final String name;
  final String? imageUrl;
  final double? radius;
  final BoxBorder? border;
  const AvatarImageText({
    Key? key,
    required this.name,
    required this.imageUrl,
    this.radius,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double radiusX = radius ?? 22.5;

    return SizedBox(
      height: radiusX * 2,
      width: radiusX * 2,
      child: CircleAvatar(
        radius: radiusX,
        backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
        child: ClipOval(
          child: imageUrl != null
              ? CustomImageView(
                  imagePath: imageUrl!,
                )
              : Text(
                  name[0].toUpperCase(),
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Theme.of(context).colorScheme.tertiary,
                        fontSize: radiusX * 1,
                      ),
                ),
        ),
      ),
    );
  }
}
