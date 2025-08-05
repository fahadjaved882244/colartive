import 'package:flutter/material.dart';
import '../../../extensions/context_x.dart';

import '../../core/app_colors.dart';
import '../../core/app_sizes.dart';

class CustomImageView extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;
  final BoxFit fit;
  final bool isDarkBg;
  final bool isVideo;

  const CustomImageView({
    super.key,
    required this.imagePath,
    this.width = double.maxFinite,
    this.height = double.maxFinite,
    this.fit = BoxFit.cover,
    this.isDarkBg = false,
    this.isVideo = false,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: context.colors.secondaryContainer),
      child: Stack(
        alignment: Alignment.center,
        children: [
          FadeInImage.assetNetwork(
            height: height,
            width: width,
            fit: fit,
            fadeInDuration: const Duration(milliseconds: 100),
            placeholder: isDarkBg
                ? 'assets/general/darkPlaceholder.png'
                : 'assets/general/placeholder.png',
            image: imagePath,
            imageErrorBuilder: (context, exception, stackTrace) {
              return DecoratedBox(
                decoration: BoxDecoration(color: context.colors.errorContainer),
                child: Image.asset(
                  'assets/general/error.png',
                  height: height,
                  width: width,
                  color: context.colors.onErrorContainer,
                  fit: BoxFit.contain,
                ),
              );
            },
          ),
          if (isVideo)
            Container(
              padding: const EdgeInsets.all(Paddings.xs + 2),
              decoration: BoxDecoration(
                color: AppColors.black.withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(Corners.rnd),
              ),
              child: const Icon(Icons.play_arrow, color: AppColors.white),
            ),
        ],
      ),
    );
  }
}
