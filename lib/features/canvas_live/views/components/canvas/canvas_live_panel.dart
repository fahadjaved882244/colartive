import 'package:colartive2/features/canvas_live/views/components/overlay_text/panel/overlay_text_panel.dart';
import 'package:colartive2/features/template/model/template.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:colartive2/features/canvas_live/controller/canvas_live_mode_controller.dart';
import 'package:colartive2/features/canvas_live/views/components/color/panel/selected_color_panel.dart';
import 'package:colartive2/features/canvas_live/views/components/transformation/panel/transformation_panel.dart';

class CanvasLivePanel extends ConsumerWidget {
  final Template template;
  const CanvasLivePanel({
    super.key,
    required this.template,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(canvasLiveModeProvider);

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      switchInCurve: Curves.ease,
      transitionBuilder: (Widget child, Animation<double> animation) {
        final inAnimation =
            Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0))
                .animate(animation);
        return ClipRect(
          child: SlideTransition(
            position: inAnimation,
            child: child,
          ),
        );
      },
      child: togglePanel(mode: mode),
    );
  }

  Widget togglePanel({
    required CanvasLiveMode mode,
  }) {
    switch (mode) {
      case CanvasLiveMode.color:
        return const SelectedColorPanel();
      case CanvasLiveMode.transformation:
        return TransformationPanel();
      case CanvasLiveMode.text:
        return const OverlayTextPanel();
    }
  }
}
