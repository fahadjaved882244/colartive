import 'package:colartive2/features/canvas_live/views/components/color/panel/selected_color_list.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'selected_color_clear_button.dart';

class SelectedColorPanel extends ConsumerWidget {
  const SelectedColorPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Row(
      children: [
        Flexible(
          flex: 9,
          fit: FlexFit.tight,
          child: SelectedColorList(),
        ),
        SizedBox(width: 4),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: SelectedColorClearButton(),
        ),
      ],
    );
  }
}
