import 'package:colartive2/features/canvas_live/controller/canvas_live_mode_controller.dart';
import 'package:colartive2/features/canvas_live/views/canvas_live_controller.dart';
import 'package:colartive2/features/canvas_live/views/components/color/panel/selected_color_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SelectedColorList extends ConsumerWidget {
  const SelectedColorList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animatedListKey = ref.watch(canvasLiveAnimatedListKeyProvider);
    final colors = ref.watch(canvasLiveControllerProvider).colors;

    return Card(
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          right: Radius.circular(8),
        ),
      ),
      child: LayoutBuilder(builder: (context, constraints) {
        return AnimatedList(
          key: animatedListKey,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          initialItemCount: colors.length,
          shrinkWrap: true,
          itemBuilder: (context, index, animation) {
            return ScaleTransition(
              scale: animation,
              child: DragTarget(
                builder: (context, accepted, rejected) {
                  return Dismissible(
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
                      ref
                          .read(canvasLiveControllerProvider.notifier)
                          .removeColorAt(index);
                    },
                    // Show a grey background as the item is swiped away.
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: SelectedColorButton(
                        index: index,
                        localHeight: constraints.maxHeight,
                      ),
                    ),
                  );
                },
                //to swap the new Color with this old Color
                onAcceptWithDetails: (DragTargetDetails<Color?> data) {
                  // if (data != null) {
                  //   setState(() {
                  //     BlocProvider.of<SelectedColorsBloc>(context).onClearRedo();
                  //     BlocProvider.of<SelectedColorsBloc>(context).onPushUndo(
                  //         ColorState(state.selectedColors[index], [index], 3));
                  //     BlocProvider.of<SelectedColorsBloc>(context)
                  //         .onSwapColor(index, data);
                  //     paletteFlag = false;
                  //   });
                  // } else {
                  //   showSnackBar(context, 'No Color Picked Yet',
                  //       "First, pick a color from below 'Color Picker' to use it again.",
                  //       seconds: 2);
                  // }
                },
              ),
            );
          },
        );
      }),
    );
  }
}
