import 'package:colartive2/features/canvas_live/controller/canvas_live_mode_controller.dart';
import 'package:colartive2/features/canvas_live/model/variation.dart';
import 'package:colartive2/features/canvas_live/views/canvas_live_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TransformationInfo extends ConsumerWidget {
  const TransformationInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final variation = ref.watch(canvasLiveControllerProvider);
    final mode = ref.watch(canvasLiveTransformationModeProvider);
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(8),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            _toggleInfo(variation: variation, mode: mode),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  String _toggleInfo({
    required Variation variation,
    required CanvasLiveTransformationMode mode,
  }) {
    switch (mode) {
      case CanvasLiveTransformationMode.scale:
        return variation.scaleFactor.toStringAsPrecision(2);
      case CanvasLiveTransformationMode.rotate:
        return (variation.rotationFactor * 360).toStringAsPrecision(3);
      case CanvasLiveTransformationMode.blur:
        return variation.blurFactor.toStringAsPrecision(2);
    }
  }
}
