import 'package:colartive2/features/canvas_live/views/canvas_live_controller.dart';
import 'package:colartive2/features/template/model/template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'template_painter.dart';

class CanvasLiveCard extends HookConsumerWidget {
  final Template template;
  const CanvasLiveCard({
    super.key,
    required this.template,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animationController =
        useAnimationController(duration: const Duration(milliseconds: 600));

    final animation = useAnimation(animationController.drive(
      Tween(begin: 0.0, end: 1.0),
    ));

    useEffect(() {
      animationController.addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          animationController.forward();
        }
        if (status == AnimationStatus.completed) {
          animationController.reverse();
        }
      });
      animationController.forward();

      // dispose the controller when the widget get disposed
      return animationController.dispose;
    }, []);
    final colors = ref.watch(canvasLiveControllerProvider).colors;
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      clipBehavior: Clip.antiAlias,
      child: colors.isNotEmpty
          ? CustomPaint(
              painter: TemplatePainter(
                colors: colors,
                template: template,
              ),
            )
          : const Card(
              elevation: 0,
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
