import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:colartive2/features/canvas/views/canvas_live/canvas_live_controller.dart';
import 'package:colartive2/features/canvas/views/canvas_live/components/color/panel/selected_color_button.dart';

class SelectedColorList extends ConsumerWidget {
  const SelectedColorList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animatedListKey =
        ref.read(canvasLiveControllerProvider.notifier).animatedListKey;
    final colors = ref.watch(canvasLiveControllerProvider).colors;

    return Card(
      margin: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          right: Radius.circular(12),
        ),
      ),
      child: LayoutBuilder(builder: (context, constraints) {
        return AnimatedList.separated(
          key: animatedListKey,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          initialItemCount: colors.length,
          shrinkWrap: true,
          separatorBuilder: (_, __, ___) {
            return const SizedBox(width: 8);
          },
          removedSeparatorBuilder: (_, __, ___) {
            return const SizedBox(width: 8);
          },
          itemBuilder: (context, index, animation) {
            return ScaleTransition(
              scale: animation,
              child: DragTarget(
                builder: (context, accepted, rejected) {
                  return SelectedColorButton(
                    index: index,
                    localHeight: constraints.maxHeight,
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
