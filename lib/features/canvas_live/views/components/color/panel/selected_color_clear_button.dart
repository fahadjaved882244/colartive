import 'package:colartive2/features/canvas_live/controller/canvas_live_mode_controller.dart';
import 'package:colartive2/features/canvas_live/views/canvas_live_controller.dart';
import 'package:colartive2/utils/components/popups/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SelectedColorClearButton extends ConsumerWidget {
  const SelectedColorClearButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(variationNotifierProvider).colors;

    return Card(
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(8),
        ),
      ),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Colors.redAccent,
        onTap: () async {
          if (colors.isNotEmpty) {
            await showCustomDialog(
              context: context,
              title: "Confirm Clear?",
              subTitle: "Sure you want to Clear everything?",
              rightButtonAction: () {
                // clear the hint
                ref.read(canvasLiveHintProvider.notifier).state = null;

                // clear the selected colors
                ref.read(variationNotifierProvider.notifier).clear();

                // set the canvas mode to color
                ref.read(canvasLiveModeProvider.notifier).state =
                    CanvasLiveMode.color;

                // pop the dialog
                Navigator.of(context, rootNavigator: true).pop(true);
              },
            );
          }
        },
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(Icons.clear),
          ],
        ),
      ),
    );
  }
}
