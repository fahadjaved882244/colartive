import 'package:colartive2/features/canvas_live/controller/canvas_live_mode_controller.dart';
import 'package:colartive2/features/canvas_live/views/components/transformation/grid/transformation_button.dart';
import 'package:flutter/material.dart';

class TransformationGrid extends StatelessWidget {
  const TransformationGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TransformationButton(
                icon: Icons.zoom_out_map_outlined,
                text: 'Scale',
                mode: CanvasLiveTransformationMode.scale,
              ),

              // Rotate
              TransformationButton(
                icon: Icons.rotate_right,
                text: 'Rotate',
                mode: CanvasLiveTransformationMode.rotate,
              ),

              // Blur
              TransformationButton(
                icon: Icons.adjust,
                text: 'Blur',
                mode: CanvasLiveTransformationMode.blur,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
