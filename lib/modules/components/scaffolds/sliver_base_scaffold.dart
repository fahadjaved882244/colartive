import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_icon_button.dart';
import '../widgets/custom_image_view.dart';

class SliverBaseScaffold extends StatelessWidget {
  final String imagePath;
  final double expandedHeight;
  final Widget expandedWidget;
  final Widget child;
  const SliverBaseScaffold({
    Key? key,
    required this.imagePath,
    required this.expandedHeight,
    required this.expandedWidget,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double imageHeight = 230;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: imageHeight + expandedHeight,
              elevation: 3,
              pinned: true,
              forceElevated: true,
              leading: CustomIconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.arrow_back),
              ),
              actions: [
                CustomIconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.share),
                ),
                CustomIconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.more_vert_outlined),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: ListView(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    CustomImageView(
                      height: imageHeight,
                      imagePath: imagePath,
                    ),
                    expandedWidget,
                  ],
                ),
              ),
            ),
          ];
        },
        body: child,
      ),
    );
  }
}
