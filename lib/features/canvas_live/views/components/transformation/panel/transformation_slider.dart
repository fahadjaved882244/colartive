import 'package:colartive2/features/canvas_live/controller/canvas_live_mode_controller.dart';
import 'package:colartive2/features/canvas_live/model/variation.dart';
import 'package:colartive2/features/canvas_live/views/canvas_live_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TransformationSlider extends ConsumerWidget {
  const TransformationSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final variation = ref.watch(canvasLiveControllerProvider);
    final mode = ref.watch(canvasLiveTransformationModeProvider);

    return Card(
      margin: const EdgeInsets.all(0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          right: Radius.circular(12),
        ),
      ),
      child: _toggleSlider(
        ref: ref,
        variation: variation,
        mode: mode,
      ),
    );
  }

  Widget _toggleSlider({
    required WidgetRef ref,
    required Variation variation,
    required CanvasLiveTransformationMode mode,
  }) {
    switch (mode) {
      case CanvasLiveTransformationMode.scale:
        return Slider(
          min: 0.7,
          max: 3.0,
          value: variation.scaleFactor,
          onChanged: (value) {
            ref
                .read(canvasLiveControllerProvider.notifier)
                .updateScaleFactore(value);
          },
        );

      case CanvasLiveTransformationMode.rotate:
        return Slider(
          value: variation.rotationFactor,
          onChanged: (value) {
            ref
                .read(canvasLiveControllerProvider.notifier)
                .updateRotation(value);
          },
        );
      case CanvasLiveTransformationMode.blur:
        return Slider(
          max: 10,
          value: variation.blurFactor,
          onChanged: (value) {
            ref.read(canvasLiveControllerProvider.notifier).updateBlur(value);
          },
        );
    }
  }
}
