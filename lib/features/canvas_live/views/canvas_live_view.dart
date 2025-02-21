import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:colartive2/extensions/context_x.dart';
import 'package:colartive2/features/canvas_live/views/components/canvas/canvas_live_card.dart';
import 'package:colartive2/features/canvas_live/views/components/canvas/canvas_live_grid.dart';
import 'package:colartive2/features/canvas_live/views/components/canvas/canvas_live_mode_bar.dart';
import 'package:colartive2/features/canvas_live/views/components/color/panel/selected_color_panel.dart';
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
            appBar: AppBar(
              title: Text(template.name),
              centerTitle: true,
            ),
            body: Stack(
              children: [
                backgroundGradient(context),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: width * 0.65,
                      height: height * 0.61,
                      child: CanvasLiveCard(
                        template: template,
                      ),
                    ),
                    SizedBox(
                      height: context.height * 0.085,
                      child: const SelectedColorPanel(),
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
