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
    final colors = ref.watch(variationNotifierProvider).colors;

    return Card(
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          right: Radius.circular(8),
        ),
      ),
      child: AnimatedList(
        key: animatedListKey,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        initialItemCount: colors.length,
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

                    ref
                        .read(variationNotifierProvider.notifier)
                        .removeColorAt(index);
                    AnimatedList.of(context).removeItem(
                      index,
                      (context, animation) => const SizedBox(),
                    );
                  },
                  // Show a grey background as the item is swiped away.
                  child: SelectedColorButton(
                    index: index,
                    notifyParent: () {},
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
      ),
    );
  }
}
