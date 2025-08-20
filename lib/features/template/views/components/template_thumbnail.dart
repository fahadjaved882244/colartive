import 'package:flutter/material.dart';

import 'package:colartive2/features/template/model/template.dart';
import 'package:colartive2/routes/app_navigation.dart';
import 'package:colartive2/utils/components/widgets/custom_image_view.dart';

class TemplateThumbnail extends StatelessWidget {
  final Template template;
  const TemplateThumbnail({super.key, required this.template});

  @override
  Widget build(BuildContext context) {
    // create a column with a card and text, card 64x64 with rounded edgegs and display an image, text on the bottom
    return Column(children: [
      InkWell(
        onTap: () {
          context.goCanvasLive(templateId: template.fontFamily);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: CustomImageView(
            imagePath: template.thumbnailUrl,
            width: 128,
            height: 128,
            isDarkBg: true,
          ),
        ),
      ),
      SizedBox(height: 8),
      SizedBox(
        width: 110,
        child: Center(
          child: Text(
            template.name,
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Montserrat',
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    ]);
  }
}
