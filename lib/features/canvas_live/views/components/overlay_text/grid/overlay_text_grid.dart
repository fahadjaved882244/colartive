import 'package:colartive2/features/canvas_live/controller/canvas_live_mode_controller.dart';
import 'package:colartive2/features/canvas_live/views/canvas_live_controller.dart';
import 'package:colartive2/features/canvas_live/views/components/overlay_text/grid/overlay_text_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FeatureTextGrid extends ConsumerWidget {
  const FeatureTextGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Add
              OverlayTextButton(
                icon: Icons.add,
                onTap: () {
                  ref.read(canvasLiveControllerProvider.notifier).addText();
                },
              ),

              // Remove
              OverlayTextButton(
                icon: Icons.cancel,
                onTap: () {
                  // ref.read(canvasLiveControllerProvider.notifier).removeText();
                },
              ),

              // Size
              const OverlayTextButton(
                icon: Icons.code,
                mode: CanvasLiveTextMode.fontSize,
              ),

              // Color
              const OverlayTextButton(
                icon: Icons.color_lens_outlined,
                mode: CanvasLiveTextMode.textColor,
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Font Family
              OverlayTextButton(
                icon: Icons.font_download_outlined,
                mode: CanvasLiveTextMode.fontFamily,
              ),

              // Format
              OverlayTextButton(
                icon: Icons.text_format,
                mode: CanvasLiveTextMode.format,
              ),

              // Rotate
              OverlayTextButton(
                icon: Icons.rotate_right,
                mode: CanvasLiveTextMode.rotate,
              ),

              // Position
              OverlayTextButton(
                icon: Icons.vertical_align_center,
                mode: CanvasLiveTextMode.position,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
