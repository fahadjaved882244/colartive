import 'package:colartive2/extensions/context_x.dart';
import 'package:colartive2/features/canvas_live/views/components/transformation/panel/transformation_info.dart';
import 'package:colartive2/features/canvas_live/views/components/transformation/panel/transformation_slider.dart';
import 'package:colartive2/features/template/model/template.dart';
import 'package:flutter/material.dart';

class TransformationPanel extends StatelessWidget {
  final Template template;
  const TransformationPanel({super.key, required this.template});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TransformationSlider(
            template: template,
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: context.width * 0.1,
          child: const TransformationInfo(),
        ),
      ],
    );
  }
}
