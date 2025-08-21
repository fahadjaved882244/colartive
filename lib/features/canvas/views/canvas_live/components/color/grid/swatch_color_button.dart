import 'package:colartive2/features/canvas/views/canvas_live/canvas_live_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SwatchColorButton extends ConsumerWidget {
  final ColorSwatch swatch;
  final ValueChanged<ColorSwatch> notifyParent;
  const SwatchColorButton({
    super.key,
    required this.swatch,
    required this.notifyParent,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final iconColor =
        swatch.computeLuminance() >= 0.5 ? Colors.black : Colors.white;

    final colors = ref.watch(canvasLiveControllerProvider).colors;

    final bool flag = checkShades(swatch, colors);

    return Material(
      color: swatch,
      elevation: 3.0,
      clipBehavior: Clip.hardEdge,
      shape: const CircleBorder(),
      child: InkWell(
        splashColor: Colors.grey,
        onTap: () {
          notifyParent(swatch);
        },
        child: flag
            ? Icon(
                Icons.check,
                color: iconColor,
                size: 19,
              )
            : Icon(
                Icons.add,
                color: iconColor,
                size: 17,
              ),
      ),
    );
  }
}

/// Check if the selected color is a shade of the main color
bool checkShades(ColorSwatch swatch, List<Color> selected) {
  for (int value = 100; value < 900; value += 100) {
    if (selected.contains(swatch[value])) return true;
  }
  return false;
}
