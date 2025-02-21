// import 'package:flutter/material.dart';

// class TransformationGrid extends StatelessWidget {
//   const TransformationGrid({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       gridDelegate: gridDelegate,
//       itemBuilder: itemBuilder,
//     );
//   }

//   List<Widget> _gridItems() {
//     return [

//       // Scale
//       FeatureButton(
//         Icons.adjust,
//         changeSize,
//         'Size',
//         () => setState(() {
//           changeSize = true;
//           blurFlag = false;
//           gradientDirFlag = false;
//           randomSeedChangeFlag = false;
//           rotationFlag = false;
//         }),
//       ),

//       // Rotate
//       FeatureButton(
//         Icons.rotate_right,
//         rotationFlag,
//         'Rotate',
//         () => setState(() {
//           rotationFlag = true;
//           changeSize = false;
//           blurFlag = false;
//           gradientDirFlag = false;
//           randomSeedChangeFlag = false;
//         }),
//       ),

//       // Blur
//       FeatureButton(
//         Icons.adjust,
//         blurFlag,
//         'Blur',
//         () => setState(() {
//           blurFlag = true;
//           changeSize = false;
//           gradientDirFlag = false;
//           randomSeedChangeFlag = false;
//           rotationFlag = false;
//         }),
//       ),

//       // 
//       FeatureButton(
//         Icons.adjust,
//         blurFlag,
//         'Blur',
//         () => setState(() {
//           blurFlag = true;
//           changeSize = false;
//           gradientDirFlag = false;
//           randomSeedChangeFlag = false;
//           rotationFlag = false;
//         }),
//       ),

//       // if (design.gradientAvailable) {
//       //   panel.add(
//       //       FeatureButton(Icons.crop_rotate, gradientDirFlag, 'Direction', () {
//       //     if (isGradLinear == 1) {
//       //       setState(() {
//       //         gradientDirFlag = true;
//       //         rotationFlag = false;
//       //         blurFlag = false;
//       //         randomSeedChangeFlag = false;
//       //         rotationFlag = false;
//       //       });
//       //     } else {
//       //       showSnackBar(context, 'Radial Gradient',
//       //           'Can not change direction of radial gradient.',
//       //           seconds: 2);
//       //     }
//       //   }));
//       // }
//       // if (design.gradientAvailable) {
//       //   panel.add(FeatureButton(
//       //     Icons.autorenew,
//       //     false,
//       //     'Gradient',
//       //     () => setState(() {
//       //       if (isGradLinear == 0) {
//       //         isGradLinear = 1;
//       //       } else {
//       //         isGradLinear = 0;
//       //       }
//       //       blurFlag = false;
//       //       rotationFlag = false;
//       //       randomSeedChangeFlag = false;
//       //       rotationFlag = false;
//       //       gradientDirFlag = false;
//       //     }),
//       //   ));
//       // }
//     ];
//   }
// }
