// import 'package:colartive2/features/canvas_live/views/components/transformation/panel/transformation_panel_info.dart';
// import 'package:flutter/material.dart';

// class TransformationPanel extends StatelessWidget {
//   const TransformationPanel({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Row(
//       children: [
//         Flexible(
//           flex: 9,
//           fit: FlexFit.loose,
//           child: SelectedColorList(),
//         ),
//         SizedBox(width: 8),
//         Flexible(
//           flex: 1,
//           fit: FlexFit.tight,
//           child: TransformationPanelInfo(),
//         ),
//       ],
//     );
//   }
// }

// Widget _featurePanelUpper() {
//   return design.canChangeSize && changeSize
//       ? Slider(
//           min: design.isBackground ? 1 : 0.6,
//           max: design.showDiscreteSlider ? 3 : 10,
//           divisions: design.showDiscreteSlider ? 10 : null,
//           value: vecSize,
//           activeColor: homeColor,
//           inactiveColor: inActiveColor,
//           onChanged: (value) {
//             setState(() {
//               vecSize = value;
//             });
//           },
//         )
//       : design.blurAvailable && blurFlag
//           ? Slider(
//               max: 10,
//               value: blurSliderValue,
//               activeColor: homeColor,
//               inactiveColor: inActiveColor,
//               onChanged: (value) {
//                 setState(() {
//                   blurSliderValue = value;
//                 });
//               },
//             )
//           : rotationFlag
//               ? Slider(
//                   value: rotationValue,
//                   activeColor: homeColor,
//                   inactiveColor: inActiveColor,
//                   onChanged: (value) {
//                     setState(() {
//                       rotationValue = value;
//                     });
//                   },
//                 )
//               : const SizedBox();
// }
