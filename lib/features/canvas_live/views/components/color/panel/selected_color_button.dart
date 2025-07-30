import 'package:colartive2/features/canvas_live/controller/canvas_live_mode_controller.dart';
import 'package:colartive2/features/canvas_live/views/canvas_live_controller.dart';
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
    final colors = ref.watch(canvasLiveControllerProvider).colors;
    final hint = ref.watch(canvasLiveHintProvider);
    final bool isSelected = hint == index;

    final brightness = ThemeData.estimateBrightnessForColor(colors[index]);
    final iconColor =
        brightness == Brightness.light ? Colors.black45 : Colors.white60;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.vertical,
        resizeDuration: const Duration(milliseconds: 200),
        onDismissed: (direction) {
          // Remove the item from the data source.
          // BlocProvider.of<SelectedColorsBloc>(context).onClearRedo();
          // BlocProvider.of<SelectedColorsBloc>(context).onPushUndo(
          //     ColorState(
          //         state.selectedColors.elementAt(index), [index], 2));

          ref.read(canvasLiveHintProvider.notifier).state = null;
          ref.read(canvasLiveControllerProvider.notifier).removeColorAt(index);
        },
        child: Material(
          color: colors[index],
          elevation: isSelected ? 5 : 1,
          shape: const CircleBorder(),
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
            child: SizedBox.square(
              dimension: isSelected ? localHeight * 0.85 : localHeight * 0.75,
              child: Center(
                child: Text(
                  '${index + 1}',
                  style: TextStyle(color: iconColor, fontSize: 16),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
