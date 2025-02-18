import 'package:colartive2/features/canvas_live/controller/canvas_live_mode_controller.dart';
import 'package:colartive2/features/canvas_live/views/canvas_live_controller.dart';
import 'package:colartive2/features/canvas_live/views/components/color/indicator_painter.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SelectedColorButton extends ConsumerWidget {
  final int index;
  final double localHeight;
  const SelectedColorButton({
    super.key,
    required this.index,
    required this.localHeight,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(variationNotifierProvider).colors;
    final hint = ref.watch(canvasLiveHintProvider);
    final bool isSelected = hint == index;

    final brightness = ThemeData.estimateBrightnessForColor(colors[index]);
    final iconColor =
        brightness == Brightness.light ? Colors.black45 : Colors.white60;

    return Material(
      elevation: isSelected ? 5 : 1,
      shape: CircleBorder(
        side: BorderSide(
          width: isSelected ? 2 : 0.7,
          // color: darkModeFlag ? darkModeColor : lightModeColor,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        splashColor: Colors.grey,
        onTap: () {
          if (isSelected) {
            ref.read(canvasLiveHintProvider.notifier).state = null;
          } else {
            ref.read(canvasLiveHintProvider.notifier).state = index;
          }
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox.square(
              dimension: localHeight * 0.85,
              child: CustomPaint(
                painter: IndicatorPainter(colors[index]),
              ),
            ),
            Text(
              '${colors.length - index}',
              style: TextStyle(color: iconColor, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
