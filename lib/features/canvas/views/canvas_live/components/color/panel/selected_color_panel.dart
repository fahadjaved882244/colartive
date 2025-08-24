import 'package:colartive2/features/canvas/views/canvas_live/components/color/panel/select_color_counter.dart';
import 'package:colartive2/features/canvas/views/canvas_live/components/color/panel/selected_color_list.dart';
import 'package:colartive2/features/template/model/template.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'selected_color_clear_button.dart';

class SelectedColorPanel extends ConsumerWidget {
  final Template template;
  const SelectedColorPanel({super.key, required this.template});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;

    return Row(
      children: [
        SizedBox(
          width: width * 0.1,
          child: SelectedColorCounter(maxColors: template.maxColors),
        ),
        const SizedBox(width: 8),
        const Expanded(
          child: SelectedColorList(),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: width * 0.1,
          child: const SelectedColorClearButton(),
        ),
      ],
    );
  }
}
