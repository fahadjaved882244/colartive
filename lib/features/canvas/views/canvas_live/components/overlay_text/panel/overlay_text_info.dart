import 'package:colartive2/features/canvas/model/overlay_text.dart';
import 'package:colartive2/features/canvas/views/canvas_live/canvas_live_mode_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:colartive2/features/canvas/views/canvas_live/canvas_live_controller.dart';

class OverlayTextInfo extends ConsumerWidget {
  const OverlayTextInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(canvasLiveTextModeProvider);

    final variation = ref.watch(canvasLiveControllerProvider);
    final index = ref.watch(canvasLiveSelectedTextProvider);
    final overlayText = index != null ? variation.overlayTexts[index] : null;

    return Card(
      margin: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(12),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (overlayText != null)
            Text(
              _toggleInfo(
                mode: mode,
                overlayText: overlayText,
                index: index!,
              ),
              textAlign: TextAlign.center,
            ),
        ],
      ),
    );
  }

  String _toggleInfo({
    required OverlayText overlayText,
    required int index,
    required CanvasLiveTextMode mode,
  }) {
    switch (mode) {
      case CanvasLiveTextMode.fontSize:
        return overlayText.fontSize.toStringAsFixed(1);
      case CanvasLiveTextMode.rotate:
        return (overlayText.rotation).toStringAsPrecision(3);

      default:
        return '';
    }
  }
}
