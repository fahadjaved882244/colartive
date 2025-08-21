import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:colartive2/extensions/context_x.dart';
import 'package:colartive2/features/canvas/views/canvas_live/components/canvas/canvas_live_card.dart';
import 'package:colartive2/features/canvas/views/canvas_live/components/canvas/canvas_live_grid.dart';
import 'package:colartive2/features/canvas/views/canvas_live/components/canvas/canvas_live_mode_bar.dart';
import 'package:colartive2/features/canvas/views/canvas_live/components/canvas/canvas_live_panel.dart';
import 'package:colartive2/features/canvas/views/canvas_live/components/overlay_text/overlay_text_stack.dart';
import 'package:colartive2/features/template/views/template_controller.dart';
import 'package:colartive2/routes/app_navigation.dart';
import 'package:colartive2/utils/components/widgets/async_switcher.dart';

class CanvasLiveView extends ConsumerWidget {
  final String templateId;
  const CanvasLiveView({required this.templateId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncTemplate = ref.watch(templateDetailProvider(templateId));

    return AsyncValueBuilder(
        asyncValue: asyncTemplate,
        builder: (template) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: Text(template.name),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: const Icon(Icons.check),
                  onPressed: () {
                    context.goCanvasFull(
                      templateId: template.fontFamily,
                    );
                  },
                ),
              ],
            ),
            body: SafeArea(
              child: LayoutBuilder(builder: (context, constraints) {
                final width = constraints.maxWidth;
                final height = constraints.maxHeight;
                return Stack(
                  children: [
                    backgroundGradient(context),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(height: 4),
                        SizedBox(
                          width: width * 0.65,
                          height: height * 0.65,
                          child: Stack(
                            children: [
                              CanvasLiveCard(
                                size: Size(width * 0.65, height * 0.65),
                                template: template,
                              ),
                              OverlayTextStack(
                                size: Size(width * 0.65, height * 0.65),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.085,
                          child: CanvasLivePanel(
                            template: template,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.2,
                          child: CanvasLiveGrid(template: template),
                        ),
                      ],
                    ),
                    Positioned(
                      right: 16,
                      top: height * 0.13,
                      child: const CanvasLiveModeBar(),
                    ),
                    // UndoButton(
                    //   onPressed: () {
                    //     // Callback for undo action
                    //   },
                    // ),
                    // RedoButton(
                    //   onPressed: () {
                    //     // Callback for redo action
                    //   },
                    // ),
                  ],
                );
              }),
            ),
          );
        });
  }

  Container backgroundGradient(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: context.darkModeFlag
            ? const LinearGradient(
                colors: [
                  Color(0xff000000),
                  Color(0xff130F40),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            : const LinearGradient(
                colors: [
                  Color(0xfff5f7fa),
                  Color(0xffc3cfe2),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
      ),
    );
  }
}
