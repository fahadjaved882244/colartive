import 'package:colartive2/features/canvas_live/views/components/color/panel/selected_color_list.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'selected_color_clear_button.dart';

class SelectedColorPanel extends ConsumerWidget {
  const SelectedColorPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;

    return Row(
      children: [
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
