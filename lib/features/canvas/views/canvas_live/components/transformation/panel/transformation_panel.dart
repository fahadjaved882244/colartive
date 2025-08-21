import 'package:flutter/material.dart';

import 'package:colartive2/features/canvas/views/canvas_live/components/transformation/panel/transformation_info.dart';
import 'package:colartive2/features/canvas/views/canvas_live/components/transformation/panel/transformation_slider.dart';

class TransformationPanel extends StatelessWidget {
  const TransformationPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Expanded(
          child: TransformationSlider(),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: width * 0.1,
          child: const TransformationInfo(),
        ),
      ],
    );
  }
}
