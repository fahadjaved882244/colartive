import 'package:colartive2/core_packages.dart';
import 'custom_image_view.dart';

class AvatarImageText extends StatelessWidget {
  final String name;
  final String? photoUrl;
  final double? radius;
  final BoxBorder? border;
  const AvatarImageText({
    Key? key,
    required this.name,
    required this.photoUrl,
    this.radius,
    this.border,
  }) : super(key: key);

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
