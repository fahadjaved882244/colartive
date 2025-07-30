import 'package:colartive2/extensions/context_x.dart';
import 'package:colartive2/features/canvas_live/controller/canvas_live_mode_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TransformationButton extends ConsumerWidget {
  final IconData icon;
  final CanvasLiveTransformationMode mode;
  final String text;
  const TransformationButton({
    super.key,
    required this.icon,
    required this.text,
    required this.mode,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modeState = ref.watch(canvasLiveTransformationModeProvider);
    final isSelected = mode == modeState;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          ref.read(canvasLiveTransformationModeProvider.notifier).state = mode;
        },
        child: Column(
          children: [
            Container(
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
            const SizedBox(height: 8),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isSelected
                    ? context.colorScheme.primary
                    : context.colorScheme.onSurface,
                fontWeight: FontWeight.w300,
              ),
            )
          ],
        ),
      ),
    );
  }
}
