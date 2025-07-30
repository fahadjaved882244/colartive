import 'package:colartive2/extensions/context_x.dart';
import 'package:colartive2/features/canvas_live/controller/canvas_live_mode_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OverlayTextButton extends ConsumerWidget {
  final IconData icon;
  final CanvasLiveTextMode? mode;
  final VoidCallback? onTap;
  const OverlayTextButton({
    super.key,
    required this.icon,
    this.mode,
    this.onTap,
  }) : assert(
          mode != null || onTap != null,
          'Either mode or onTap must be provided',
        );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modeState = ref.watch(canvasLiveTextModeProvider);
    final isSelected = mode == modeState;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          if (onTap != null) {
            onTap!();
          } else if (mode != null) {
            ref.read(canvasLiveTextModeProvider.notifier).state = mode!;
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected
                ? context.colorScheme.primary
                : context.colorScheme.tertiaryContainer,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: isSelected
                ? context.colorScheme.onPrimary
                : context.colorScheme.onTertiaryContainer,
            size: 28,
          ),
        ),
      ),
    );
  }
}
