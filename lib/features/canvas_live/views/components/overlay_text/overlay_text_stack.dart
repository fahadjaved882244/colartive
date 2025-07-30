import 'package:colartive2/features/canvas_live/views/canvas_live_controller.dart';
import 'package:colartive2/features/canvas_live/views/components/overlay_text/painter/overlay_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:colartive2/features/canvas_live/views/components/overlay_text/painter/axis_line_painter.dart';

class OverlayTextStack extends HookConsumerWidget {
  final Size size;
  const OverlayTextStack({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showAxis = useState(false);

    final variation = ref.watch(canvasLiveControllerProvider);

    return Stack(
      children: [
        if (showAxis.value)
          CustomPaint(
            size: size,
            painter: AxisLinePainter(),
          ),
        for (int i = 0; i < variation.overlayTexts.length; i++)
          OverlayTextWidget(
            index: i,
            text: variation.overlayTexts[i],
            canvasSize: size,
            canShowAxis: (flag) {
              showAxis.value = flag;
            },
          )
      ],
    );
  }
}
