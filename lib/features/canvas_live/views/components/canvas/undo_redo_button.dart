import 'package:colartive2/features/canvas_live/controller/canvas_live_mode_controller.dart';
import 'package:colartive2/features/canvas_live/views/canvas_live_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UndoButton extends ConsumerWidget {
  final VoidCallback onPressed;

  const UndoButton({super.key, required this.onPressed});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final canUndo = ref.watch(canvasLiveControllerProvider);
    return AnimatedPositioned(
      curve: Curves.ease,
      duration: const Duration(milliseconds: 300),
      left:
          ref.watch(canvasLiveControllerProvider.notifier).canUndo ? 16 : -100,
      top: MediaQuery.of(context).size.height * 0.50,
      child: IconButton.filledTonal(
        onPressed: () {
          ref.read(canvasLiveControllerProvider.notifier).undo();
          if (!ref.read(canvasLiveControllerProvider.notifier).canUndo) {
            ref.read(canvasLiveTextModeProvider.notifier).state =
                CanvasLiveTextMode.add;
            ref.read(canvasLiveModeProvider.notifier).state =
                CanvasLiveMode.color;
          }
          onPressed();
        },
        icon: Icon(Icons.undo),
      ),
    );
  }
}

class RedoButton extends ConsumerWidget {
  final VoidCallback onPressed;

  const RedoButton({super.key, required this.onPressed});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final canRedo = ref.watch(canvasLiveControllerProvider);

    return AnimatedPositioned(
      curve: Curves.ease,
      duration: const Duration(milliseconds: 300),
      right:
          ref.watch(canvasLiveControllerProvider.notifier).canRedo ? 16 : -100,
      top: MediaQuery.of(context).size.height * 0.55,
      child: IconButton.filledTonal(
        onPressed: () {
          ref.read(canvasLiveControllerProvider.notifier).redo();

          onPressed();
        },
        icon: Icon(Icons.redo),
      ),
    );
  }
}
