import 'package:colartive2/features/canvas_live/views/components/canvas/canvas_live_panel.dart';
import 'package:colartive2/features/canvas_live/views/components/feature_text/axis_line.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:colartive2/extensions/context_x.dart';
import 'package:colartive2/features/canvas_live/views/components/canvas/canvas_live_card.dart';
import 'package:colartive2/features/canvas_live/views/components/canvas/canvas_live_grid.dart';
import 'package:colartive2/features/canvas_live/views/components/canvas/canvas_live_mode_bar.dart';
import 'package:colartive2/features/template/views/template_controller.dart';
import 'package:colartive2/utils/components/widgets/async_switcher.dart';

class CanvasLiveView extends ConsumerWidget {
  const CanvasLiveView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final asyncTemplate = ref.watch(templateDetailProvider("BabyYoda"));

    return AsyncValueBuilder(
        asyncValue: asyncTemplate,
        builder: (template) {
          return Scaffold(
            body: Stack(
              children: [
                backgroundGradient(context),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        template.name,
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.65,
                      height: height * 0.61,
                      child: Stack(
                        children: [
                          CanvasLiveCard(
                            size: Size(width * 0.65, height * 0.61),
                            template: template,
                          ),
                          SizedBox(
                            width: width * 0.65,
                            height: height * 0.61,
                            child: CustomPaint(
                              painter: AxisLine(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: context.height * 0.085,
                      child: CanvasLivePanel(
                        template: template,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.18,
                      child: CanvasLiveGrid(template: template),
                    ),
                  ],
                ),
                Positioned(
                  right: 16,
                  top: height * 0.13,
                  child: const CanvasLiveModeBar(),
                ),
              ],
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
