import 'package:colartive2/extensions/context_x.dart';
import 'package:colartive2/features/canvas_live/controller/canvas_live_mode_controller.dart';
import 'package:colartive2/features/canvas_live/views/canvas_live_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OverlayTextButton extends ConsumerWidget {
  final IconData icon;
  final String label;
  final CanvasLiveTextMode modeId;
  const OverlayTextButton({
    super.key,
    required this.icon,
    required this.label,
    required this.modeId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEnabled = ref.watch(canvasLiveSelectedTextProvider) != null ||
        modeId == CanvasLiveTextMode.add;

    final modeValue = ref.watch(canvasLiveTextModeProvider);
    final isSelected = modeId == modeValue && modeId != CanvasLiveTextMode.add;
    return Column(
      children: [
        IconButton.filled(
          iconSize: 28,
          isSelected: isSelected,
          icon: Icon(
            icon,
            size: 28,
          ),
          onPressed: isEnabled
              ? () {
                  if (modeId == CanvasLiveTextMode.add) {
                    ref.read(canvasLiveControllerProvider.notifier).addText();
                  } else if (modeId == CanvasLiveTextMode.remove) {
                    ref
                        .read(canvasLiveControllerProvider.notifier)
                        .removeText();
                  } else {
                    ref.read(canvasLiveTextModeProvider.notifier).state =
                        modeId;
                  }
                }
              : null,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: !isEnabled
                ? context.colorScheme.onSurface.withValues(alpha: 0.5)
                : isSelected
                    ? context.colorScheme.primary
                    : context.colorScheme.onSurface,
            // .withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }
}
