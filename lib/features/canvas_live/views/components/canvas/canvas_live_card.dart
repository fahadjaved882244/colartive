import 'package:colartive2/features/canvas_live/controller/canvas_live_mode_controller.dart';
import 'package:colartive2/features/canvas_live/views/canvas_live_controller.dart';
import 'package:colartive2/features/template/model/template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'template_painter.dart';

class CanvasLiveCard extends HookConsumerWidget {
  final Size size;
  final Template template;
  const CanvasLiveCard({
    super.key,
    required this.size,
    required this.template,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final variation = ref.watch(canvasLiveControllerProvider);
    final hint = ref.watch(canvasLiveHintProvider);

    final animationController =
        useAnimationController(duration: const Duration(milliseconds: 600));

    final animation = useAnimation(animationController.drive(
      Tween(begin: 0.3, end: 1.0),
    ));

    useEffect(() {
      if (hint == null) {
        animationController.stop();
      } else {
        animationController.repeat(reverse: true);
      }
      return null;
    }, [hint]);

    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      clipBehavior: Clip.antiAlias,
      child: variation.colors.isNotEmpty
          ? AnimatedBuilder(
              animation: animationController,
              builder: (context, child) {
                return CustomPaint(
                  size: size,
                  painter: TemplatePainter(
                    variation: variation,
                    template: template,
                    hintIndex: hint,
                    hintOpacity: animation,
                  ),
                  willChange: true,
                );
              })
          : const Card(
              child: Center(
                child: Text(
                  'To Create Your Own Wallpaper:\nChoose Colors Below\n\nor\n\nTo Modify Sample Palettes:\nSwipe Left / Right',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    // color: darkModeFlag ? darkModeColor : lightModeColor,
                    // fontSize: width * 0.04,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'arial_48',
                  ),
                ),
              ),
            ),
    );
  }
}
