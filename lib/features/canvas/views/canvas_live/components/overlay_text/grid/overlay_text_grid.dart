import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:colartive2/features/canvas/views/canvas_live/components/overlay_text/grid/overlay_text_button.dart';
import 'package:colartive2/features/canvas/views/canvas_live/canvas_live_mode_controller.dart';

class OverlayTextGrid extends ConsumerWidget {
  const OverlayTextGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Add
              OverlayTextButton(
                icon: Icons.add,
                label: 'Add',
                modeId: CanvasLiveTextMode.add,
              ),

              // Remove
              OverlayTextButton(
                icon: Icons.close,
                label: 'Remove',
                modeId: CanvasLiveTextMode.remove,
              ),

              // Size
              const OverlayTextButton(
                icon: Icons.code,
                label: 'Size',
                modeId: CanvasLiveTextMode.fontSize,
              ),

              // Color
              const OverlayTextButton(
                icon: Icons.color_lens_outlined,
                label: 'Color',
                modeId: CanvasLiveTextMode.color,
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Font Family
              OverlayTextButton(
                icon: Icons.font_download_outlined,
                label: 'Font',
                modeId: CanvasLiveTextMode.fontFamily,
              ),

              // Format
              OverlayTextButton(
                icon: Icons.text_format,
                label: 'Format',
                modeId: CanvasLiveTextMode.format,
              ),

              // Rotate
              OverlayTextButton(
                icon: Icons.rotate_right,
                label: 'Rotate',
                modeId: CanvasLiveTextMode.rotate,
              ),

              // Position
              OverlayTextButton(
                icon: Icons.vertical_align_center,
                label: 'Position',
                modeId: CanvasLiveTextMode.position,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
