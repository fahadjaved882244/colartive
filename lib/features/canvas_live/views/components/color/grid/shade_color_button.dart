import 'package:colartive2/features/canvas_live/controller/canvas_live_mode_controller.dart';
import 'package:colartive2/features/canvas_live/views/canvas_live_controller.dart';
import 'package:colartive2/features/template/model/template.dart';
import 'package:colartive2/utils/components/popups/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ShadeColorButton extends ConsumerWidget {
  final Template template;
  final Color color;
  final bool isPickerClr;
  final VoidCallback notifyParent;
  const ShadeColorButton({
    super.key,
    required this.template,
    required this.color,
    required this.notifyParent,
    this.isPickerClr = false,
  });

  int countTotal(List<Color> list, Color clr) {
    int c = 0;
    for (int i = 0; i < list.length; i++) {
      if (list[i] == clr) c = c + 1;
    }
    return c;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final width = MediaQuery.of(context).size.width;
    final brightness = ThemeData.estimateBrightnessForColor(color);
    final iconColor =
        brightness == Brightness.light ? Colors.black : Colors.white;

    final hintIndex = ref.watch(canvasLiveHintProvider);
    final selectedColors = ref.watch(canvasLiveControllerProvider).colors;
    final selectedLength = selectedColors.length;
    final count = countTotal(selectedColors, color);
    return Material(
      color: color,
      shape: CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        splashColor: Colors.grey,
        highlightColor: Colors.red,
        onTap: () {
          if (hintIndex != null) {
            ref
                .read(canvasLiveControllerProvider.notifier)
                .updateColor(hintIndex, color);
            ref.read(canvasLiveHintProvider.notifier).state = null;

            // BlocProvider.of<SelectedColorsBloc>(context).onClearRedo();
            // BlocProvider.of<SelectedColorsBloc>(context).onPushUndo(
            //     ColorState(state.selectedColors[hintIndex], [hintIndex], 3));

            notifyParent();
          } else if (selectedLength < template.maxColors) {
            ref.read(canvasLiveHintProvider.notifier).state = null;
            ref.read(canvasLiveControllerProvider.notifier).addColor(color);

            // BlocProvider.of<SelectedColorsBloc>(context).onClearRedo();
            // BlocProvider.of<SelectedColorsBloc>(context).onPushUndo(
            //     ColorState(color, [state.selectedColors.length], 1));
            notifyParent();
          } else {
            showCustomSnackBar(context, 'Maximun colors has been selected');
          }
        },
        onLongPress: () {
          // final List<int> temp = [];
          // for (int i = 0; i < count; i++) {
          //   final int removeIndex = state.selectedColors.indexOf(color);
          //   temp.add(removeIndex);
          //   BlocProvider.of<SelectedColorsBloc>(context)
          //       .onRemoveColor(removeIndex);
          //   state.listKey.currentState.removeItem(
          //       removeIndex, (context, animation) => const SizedBox(),
          //       duration: const Duration());
          // }
          // BlocProvider.of<SelectedColorsBloc>(context).onClearRedo();
          // BlocProvider.of<SelectedColorsBloc>(context)
          //     .onPushUndo(ColorState(color, temp, 2));
          // count > 0 ? count-- : count = 0;
          // notifyParent();
        },
        child: SizedBox(
          child:
              // isPickerClr
              //     ? Stack(
              //         alignment: Alignment.center,
              //         children: [
              //           if (color != null)
              //             SizedBox(
              //               width: size,
              //               height: size,
              //               child: CustomPaint(
              //                 painter: IndicatorPainter(color!),
              //               ),
              //             )
              //           else
              //             const SizedBox(),
              //           if (color == null)
              //             Transform(
              //                 alignment: AlignmentDirectional.center,
              //                 transform: Matrix4.rotationZ(-0.5),
              //                 child: Container(
              //                   color: Colors.red,
              //                   height: 2,
              //                 ))
              //           else
              //             !isDragged
              //                 ? Icon(
              //                     Icons.color_lens,
              //                     color: iconColor,
              //                     size: size * 0.43,
              //                   )
              //                 : const SizedBox()
              //         ],
              //       )
              // :
              count != 0
                  ? Center(
                      child: Text(
                        '$count',
                        style: TextStyle(
                          color: iconColor,
                          fontSize: 16,
                          fontFamily: 'Open Sans',
                        ),
                      ),
                    )
                  : const SizedBox(),
        ),
      ),
    );
  }
}
