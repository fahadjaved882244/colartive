import 'package:colartive2/features/canvas_live/controller/canvas_live_mode_controller.dart';
import 'package:colartive2/features/canvas_live/views/components/feature_text/grid/feature_text_button.dart';
import 'package:flutter/material.dart';

class FeatureTextGrid extends StatelessWidget {
  const FeatureTextGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Add
              FeatureTextButton(
                icon: Icons.add,
                text: 'Add',
                mode: CanvasLiveTextMode.fontSize,
              ),

              // Remove
              FeatureTextButton(
                icon: Icons.cancel,
                text: 'Remove',
                mode: CanvasLiveTextMode.textColor,
              ),

              // Size
              FeatureTextButton(
                icon: Icons.code,
                text: 'Size',
                mode: CanvasLiveTextMode.fontSize,
              ),

              // Color
              FeatureTextButton(
                icon: Icons.color_lens_outlined,
                text: 'Color',
                mode: CanvasLiveTextMode.textColor,
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Font Family
              FeatureTextButton(
                icon: Icons.font_download_outlined,
                text: 'Font',
                mode: CanvasLiveTextMode.fontFamily,
              ),

              // Format
              FeatureTextButton(
                icon: Icons.text_format,
                text: 'Style',
                mode: CanvasLiveTextMode.format,
              ),

              // Rotate
              FeatureTextButton(
                icon: Icons.rotate_right,
                text: 'Rotate',
                mode: CanvasLiveTextMode.rotate,
              ),

              // Position
              FeatureTextButton(
                icon: Icons.vertical_align_center,
                text: 'Position',
                mode: CanvasLiveTextMode.position,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
