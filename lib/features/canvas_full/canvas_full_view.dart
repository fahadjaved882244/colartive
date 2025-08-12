import 'package:colartive2/features/canvas_live/views/canvas_live_controller.dart';
import 'package:colartive2/features/canvas_live/views/components/canvas/template_painter.dart';
import 'package:colartive2/features/template/views/template_controller.dart';
import 'package:colartive2/utils/components/widgets/async_switcher.dart';
import 'package:colartive2/features/canvas_full/components/canvas_full_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CanvasFullView extends ConsumerWidget {
  final String templateId;
  const CanvasFullView({required this.templateId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncTemplate = ref.watch(templateDetailProvider(templateId));
    final variation = ref.watch(canvasLiveControllerProvider);

    final canvasSize = Size(
      MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.height,
    );
    return AsyncValueBuilder(
      asyncValue: asyncTemplate,
      builder: (template) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.black,
          body: SizedBox(
            width: canvasSize.width,
            height: canvasSize.height,
            child: Stack(
              children: [
                // Placeholder for the canvas background
                RepaintBoundary(
                  child: CustomPaint(
                    size: canvasSize,
                    willChange: false,
                    painter: TemplatePainter(
                      variation: variation,
                      template: template,
                      hintIndex: null,
                      hintOpacity: 1.0,
                      paintOverlay: true,
                      isCanvasFull: true,
                    ),
                  ),
                ),
                Positioned(
                  left: 16,
                  top: 64,
                  child: IconButton.outlined(
                    onPressed: () {
                      context.pop();
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                ),
                // Floating Action Button to show bottom sheet
                // Positioned(
                //   right: 16,
                //   bottom: 80,
                //   child: FloatingActionButton(
                //     onPressed: () {
                //       showModalBottomSheet(
                //         context: context,
                //         isScrollControlled: true,
                //         backgroundColor: Colors.transparent,
                //         builder: (context) => CanvasActionsBottomSheet(
                //           canvasSize: canvasSize,
                //           variation: variation,
                //           template: template,
                //         ),
                //       );
                //     },
                //     backgroundColor: Colors.white,
                //     child: const Icon(
                //       Icons.download,
                //       color: Colors.black87,
                //     ),
                //   ),
                // ),
                NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (OverscrollIndicatorNotification overscroll) {
                    overscroll.disallowIndicator();
                    return true;
                  },
                  child: DraggableScrollableSheet(
                    initialChildSize: 0.302,
                    minChildSize: 0.06,
                    maxChildSize: 0.38,
                    builder: (BuildContext context, controller) {
                      return SingleChildScrollView(
                        controller: controller,
                        child: CanvasFullBottomSheet(
                          canvasSize: canvasSize,
                          variation: variation,
                          template: template,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
