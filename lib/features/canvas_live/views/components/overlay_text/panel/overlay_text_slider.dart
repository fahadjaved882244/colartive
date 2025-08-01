import 'package:colartive2/features/canvas_live/controller/canvas_live_mode_controller.dart';
import 'package:colartive2/features/canvas_live/model/overlay_text.dart';
import 'package:colartive2/features/canvas_live/views/canvas_live_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OverlayTextSlider extends ConsumerWidget {
  const OverlayTextSlider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(canvasLiveTextModeProvider);

    final overlayTextList =
        ref.watch(canvasLiveControllerProvider.select((v) => v.overlayTexts));
    final index = ref.watch(canvasLiveSelectedTextProvider);
    final overlayText = index != null ? overlayTextList[index] : null;

    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          right: Radius.circular(12),
        ),
      ),
      child: overlayText != null
          ? _toggleSlider(
              ref: ref,
              index: index!,
              overlayText: overlayText,
              mode: mode,
            )
          : Center(
              child: SizedBox(),
            ),
    );
  }

  Widget _toggleSlider({
    required WidgetRef ref,
    required int index,
    required OverlayText overlayText,
    required CanvasLiveTextMode mode,
  }) {
    switch (mode) {
      case CanvasLiveTextMode.fontSize:
        return Slider(
          min: 12,
          max: 100,
          value: overlayText.fontSize,
          onChanged: (value) {
            ref
                .read(canvasLiveControllerProvider.notifier)
                .updateTextFontSize(index, value);
          },
        );

      case CanvasLiveTextMode.rotate:
        return Slider(
          value: overlayText.rotation,
          onChanged: (value) {
            ref
                .read(canvasLiveControllerProvider.notifier)
                .updateTextRotation(index, value);
          },
        );
      default:
        return Center(child: SizedBox());
    }
  }
}
