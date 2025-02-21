import 'package:colartive2/features/canvas_live/controller/canvas_live_mode_controller.dart';
import 'package:colartive2/features/canvas_live/views/components/color/grid/color_button_grid.dart';
import 'package:colartive2/features/canvas_live/views/components/transformation/grid/transformation_grid.dart';
import 'package:colartive2/features/template/model/template.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CanvasLiveGrid extends ConsumerWidget {
  final Template template;
  const CanvasLiveGrid({
    super.key,
    required this.template,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(canvasLiveModeProvider);

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      switchInCurve: Curves.ease,
      transitionBuilder: (child, animation) {
        final inAnimation = Tween<Offset>(
          begin: const Offset(-1, 0),
          end: const Offset(0, 0),
        ).animate(animation);
        return ClipRect(
          child: SlideTransition(
            position: inAnimation,
            child: child,
          ),
        );
      },
      child: toggleGrid(mode: mode, template: template),
    );
  }

  Widget toggleGrid({
    required CanvasLiveMode mode,
    required Template template,
  }) {
    switch (mode) {
      case CanvasLiveMode.color:
        return ColorButtonGrid(
          template: template,
        );
      case CanvasLiveMode.transformation:
        return const TransformationGrid();
      case CanvasLiveMode.text:
        return ColorButtonGrid(
          template: template,
        );
    }
  }
}
