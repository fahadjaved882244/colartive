import 'package:colartive2/features/canvas_live/controller/canvas_live_mode_controller.dart';
import 'package:colartive2/features/canvas_live/views/components/color/grid/color_pallet.dart';
import 'package:colartive2/features/canvas_live/views/components/color/grid/shade_color_button.dart';
import 'package:colartive2/features/template/model/template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'swatch_color_button.dart';

class ColorButtonGrid extends HookConsumerWidget {
  final Template template;
  const ColorButtonGrid({
    super.key,
    required this.template,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSwatch = useState<ColorSwatch?>(null);
    final colorMode = ref.watch(canvasLiveColorModeProvider);

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      switchInCurve: Curves.ease,
      switchOutCurve: Curves.fastLinearToSlowEaseIn,
      transitionBuilder: (child, animation) {
        final inAnimation = Tween<Offset>(
          begin: const Offset(0.0, 1.0),
          end: const Offset(0.0, 0.0),
        ).animate(animation);
        final outAnimation = Tween<Offset>(
          begin: const Offset(0.0, -1.0),
          end: const Offset(0.0, 0.0),
        ).animate(animation);

        if (child.key == const ValueKey(2)) {
          return ClipRect(
            child: SlideTransition(
              position: inAnimation,
              child: child,
            ),
          );
        } else {
          return ClipRect(
            child: SlideTransition(
              position: outAnimation,
              child: child,
            ),
          );
        }
      },
      child: _toggleGrid(
        colorMode: colorMode,
        selectedSwatch: selectedSwatch.value,
        notifyParent: (swatch) {
          selectedSwatch.value = swatch;
        },
      ),
    );
  }

  Widget _toggleGrid({
    required CanvasLiveColorMode colorMode,
    required ColorSwatch? selectedSwatch,
    required ValueChanged<ColorSwatch?> notifyParent,
  }) {
    switch (colorMode) {
      case CanvasLiveColorMode.swatch:
        if (selectedSwatch == null) {
          return _swatchGrid(
            notifyParent: notifyParent,
          );
        } else {
          return _swatchShadesGrid(
            selectedSwatch: selectedSwatch,
            notifyParent: notifyParent,
          );
        }

      case CanvasLiveColorMode.single:
        return _singleShadesGrid();
    }
  }

  Widget _swatchGrid({
    required ValueChanged<ColorSwatch?> notifyParent,
  }) {
    return Card(
      key: const ValueKey(1),
      child: GridView.count(
        key: const PageStorageKey('Main Color Button'),
        padding: const EdgeInsets.all(16),
        mainAxisSpacing: 8,
        crossAxisSpacing: 4,
        crossAxisCount: 2,
        childAspectRatio: 1.05,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        children: _buildListMainColor(
          notifyParent: notifyParent,
        ),
      ),
    );
  }

  Widget _swatchShadesGrid({
    required ColorSwatch selectedSwatch,
    required ValueChanged<ColorSwatch?> notifyParent,
  }) {
    return Card(
      key: const ValueKey(2),
      child: GridView.count(
        padding: const EdgeInsets.all(16),
        mainAxisSpacing: 8,
        crossAxisSpacing: 4,
        crossAxisCount: 2,
        childAspectRatio: 1.05,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        children: _buildListShadesColor(
          selectedSwatch: selectedSwatch,
          notifyParent: notifyParent,
        ),
      ),
    );
  }

  Widget _singleShadesGrid() {
    return const SizedBox();
    // return Container(
    //   key: const ValueKey(3),
    //   height: widget.height,
    //   width: widget.width,
    //   decoration: BoxDecoration(
    //     color: darkModeFlag ? jetBlack : lightModeBgColor,
    //   ),
    //   child: GridView.count(
    //     key: const PageStorageKey('Shades Color Button'),
    //     padding: EdgeInsets.only(
    //       top: height * 0.0175,
    //       bottom: height * 0.0175,
    //       left: width * 0.01,
    //       right: width * 0.01,
    //     ),
    //     crossAxisSpacing: width * 0.025,
    //     crossAxisCount: 2,
    //     childAspectRatio: (width / height) + 0.35,
    //     scrollDirection: Axis.horizontal,
    //     physics: const BouncingScrollPhysics(),
    //     children: _buildListAllShadesColor(state),
    //   ),
    // );
  }

  List<Widget> _buildListMainColor({
    required ValueChanged<ColorSwatch> notifyParent,
  }) {
    return [
      ...colorSwatches.map(
        (swatch) => SwatchColorButton(
          swatch: swatch,
          notifyParent: notifyParent,
        ),
      ),

      // Draggable(
      //   feedback: ShadedColorButton(
      //     widget.maxColors,
      //     color: pickerColor,
      //     size: sizeOfButton - (sizeOfButton * 0.3),
      //     notifyParent: shadedColorCallback,
      //     isPickerClr: true,
      //     isDragged: true,
      //   ),
      //   data: pickerColor,
      //   child: ShadedColorButton(
      //     widget.maxColors,
      //     color: pickerColor,
      //     size: sizeOfButton,
      //     notifyParent: shadedColorCallback,
      //     isPickerClr: true,
      //   ),
      // ),
      // ColorPickerButton(
      //     size: sizeOfButton,
      //     onTap: (pc) {
      //       if (hintIndex != -1) {
      //         BlocProvider.of<SelectedColorsBloc>(context)
      //             .onSwapColor(hintIndex, pc);
      //         BlocProvider.of<SelectedColorsBloc>(context).onClearRedo();
      //         BlocProvider.of<SelectedColorsBloc>(context).onPushUndo(
      //             ColorState(state.selectedColors[hintIndex] as Color,
      //                 [hintIndex], 3));
      //         paletteFlag = false;
      //         hintIndex = -1;
      //         hintModeFlag = false;
      //         widget.notifyParent();
      //         Navigator.pop(context);
      //       } else if (state.selectedColors.length as int < widget.maxColors) {
      //         BlocProvider.of<SelectedColorsBloc>(context).onAddColor(pc);
      //         BlocProvider.of<SelectedColorsBloc>(context).onClearRedo();
      //         BlocProvider.of<SelectedColorsBloc>(context).onPushUndo(
      //             ColorState(pc, [state.selectedColors.length as int], 1));
      //         if (state.selectedColors.isNotEmpty as bool) {
      //           state.listKey.currentState.insertItem(0);
      //         }
      //         pickerColor = pc;
      //         paletteFlag = false;
      //         widget.notifyParent();
      //         Navigator.pop(context);
      //       } else {
      //         pickerColor = pc;
      //         widget.notifyParent();
      //         Navigator.pop(context);
      //         showSnackBar(context, 'Maximun Colors Selected',
      //             'You can not select more than ${widget.maxColors} colors for this design',
      //             seconds: 2);
      //       }
      //     }),
    ];
  }

  // void shadedColorCallback() {
  //   if (mounted) {
  //     isMainSelected = false;
  //     widget.notifyParent();
  //   }
  // }

  List<Widget> _buildListShadesColor({
    required ColorSwatch selectedSwatch,
    required ValueChanged<ColorSwatch?> notifyParent,
  }) {
    return [
      GestureDetector(
        onTap: () {
          notifyParent(null);
        },
        child: const Material(
          color: Colors.transparent,
          shape: CircleBorder(),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Icon(Icons.arrow_back),
          ),
        ),
      ),
      for (final color in getSwatchShades(selectedSwatch))
        Draggable(
          feedback: ShadeColorButton(
            template: template,
            color: color,
            isDragged: true,
            notifyParent: () {
              notifyParent(null);
            },
          ),
          data: color,
          child: ShadeColorButton(
            template: template,
            color: color,
            notifyParent: () {
              notifyParent.call(null);
            },
          ),
        )
    ];
  }

  // List<Color> _getMaterialColorAllShades(ColorSwatch color) {
  //   return <Color>[
  //     if (color[100] != null) color[100],
  //     if (color[300] != null) color[300],
  //     if (color[500] != null) color[500],
  //     if (color[700] != null) color[700],
  //     if (color[900] != null) color[900],
  //   ];
  // }

  // List<Widget> _buildListAllShadesColor(state) {
  //   return [
  //     Draggable(
  //       feedback: ShadedColorButton(
  //         widget.maxColors,
  //         color: pickerColor,
  //         size: sizeOfButton - (sizeOfButton * 0.3),
  //         notifyParent: shadedColorCallback,
  //         isPickerClr: true,
  //         isDragged: true,
  //       ),
  //       data: pickerColor,
  //       child: ShadedColorButton(
  //         widget.maxColors,
  //         color: pickerColor,
  //         size: sizeOfButton,
  //         notifyParent: shadedColorCallback,
  //         isPickerClr: true,
  //       ),
  //     ),
  //     ColorPickerButton(
  //         size: sizeOfButton,
  //         onTap: (pc) {
  //           if (hintIndex != -1) {
  //             BlocProvider.of<SelectedColorsBloc>(context)
  //                 .onSwapColor(hintIndex, pc);
  //             BlocProvider.of<SelectedColorsBloc>(context).onClearRedo();
  //             BlocProvider.of<SelectedColorsBloc>(context).onPushUndo(
  //                 ColorState(state.selectedColors[hintIndex] as Color,
  //                     [hintIndex], 3));
  //             paletteFlag = false;
  //             hintIndex = -1;
  //             hintModeFlag = false;
  //             widget.notifyParent();
  //             Navigator.pop(context);
  //           } else if (state.selectedColors.length as int < widget.maxColors) {
  //             BlocProvider.of<SelectedColorsBloc>(context).onAddColor(pc);
  //             BlocProvider.of<SelectedColorsBloc>(context).onClearRedo();
  //             BlocProvider.of<SelectedColorsBloc>(context).onPushUndo(
  //                 ColorState(pc, [state.selectedColors.length as int], 1));
  //             if (state.selectedColors.isNotEmpty as bool) {
  //               state.listKey.currentState.insertItem(0);
  //             }
  //             pickerColor = pc;
  //             paletteFlag = false;
  //             widget.notifyParent();
  //             Navigator.pop(context);
  //           } else {
  //             pickerColor = pc;
  //             widget.notifyParent();
  //             Navigator.pop(context);
  //             showSnackBar(context, 'Maximun Colors Selected',
  //                 'You can not select more than ${widget.maxColors} colors for this design',
  //                 seconds: 2);
  //           }
  //         }),
  //     for (final mainColor in materialColors)
  //       for (final color in _getMaterialColorAllShades(mainColor))
  //         ShadedColorButton(
  //           widget.maxColors,
  //           color: color,
  //           size: sizeOfButton,
  //           notifyParent: shadedColorCallback,
  //         )
  //   ];
  // }
}
