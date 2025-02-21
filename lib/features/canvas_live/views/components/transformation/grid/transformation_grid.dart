import 'package:colartive2/features/canvas_live/views/components/transformation/grid/transformation_button.dart';
import 'package:flutter/material.dart';

class TransformationGrid extends StatelessWidget {
  const TransformationGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      key: const PageStorageKey('Transformation Grid'),
      padding: const EdgeInsets.all(16),
      mainAxisSpacing: 8,
      crossAxisSpacing: 4,
      crossAxisCount: 1,
      childAspectRatio: 1.05,
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      children: _gridItems(),
    );
  }

  List<Widget> _gridItems() {
    return [
      // Scale
      TransformationButton(
        icon: Icons.zoom_out_map_outlined,
        text: 'Scale',
        isSelected: false,
        onTap: () {},
      ),

      // Rotate
      TransformationButton(
        icon: Icons.rotate_right,
        text: 'Rotate',
        isSelected: false,
        onTap: () {},
      ),

      // Blur
      TransformationButton(
        icon: Icons.adjust,
        isSelected: false,
        text: 'Blur',
        onTap: () {},
      ),

      //
      TransformationButton(
        icon: Icons.adjust,
        text: 'Blur',
        isSelected: false,
        onTap: () {},
      ),

      // if (design.gradientAvailable) {
      //   panel.add(
      //       FeatureButton(Icons.crop_rotate, gradientDirFlag, 'Direction', () {
      //     if (isGradLinear == 1) {
      //       setState(() {
      //         gradientDirFlag = true;
      //         rotationFlag = false;
      //         blurFlag = false;
      //         randomSeedChangeFlag = false;
      //         rotationFlag = false;
      //       });
      //     } else {
      //       showSnackBar(context, 'Radial Gradient',
      //           'Can not change direction of radial gradient.',
      //           seconds: 2);
      //     }
      //   }));
      // }
      // if (design.gradientAvailable) {
      //   panel.add(FeatureButton(
      //     Icons.autorenew,
      //     false,
      //     'Gradient',
      //     () => setState(() {
      //       if (isGradLinear == 0) {
      //         isGradLinear = 1;
      //       } else {
      //         isGradLinear = 0;
      //       }
      //       blurFlag = false;
      //       rotationFlag = false;
      //       randomSeedChangeFlag = false;
      //       rotationFlag = false;
      //       gradientDirFlag = false;
      //     }),
      //   ));
      // }
    ];
  }
}
