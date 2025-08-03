import 'package:colartive2/features/canvas_live/controller/canvas_live_mode_controller.dart';
import 'package:colartive2/features/canvas_live/views/components/overlay_text/panel/overlay_text_info.dart';
import 'package:colartive2/features/canvas_live/views/components/overlay_text/panel/overlay_text_slider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OverlayTextPanel extends ConsumerWidget {
  const OverlayTextPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;

    final mode = ref.watch(canvasLiveTextModeProvider);
    return Row(
      children: [
        Expanded(
          child: OverlayTextSlider(),
        ),
        if (mode == CanvasLiveTextMode.fontSize ||
            mode == CanvasLiveTextMode.rotate) ...[
          const SizedBox(width: 8),
          SizedBox(
            width: width * 0.1,
            child: const OverlayTextInfo(),
          ),
        ],
      ],
    );
  }
}
