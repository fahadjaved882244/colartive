import 'package:colartive2/extensions/context_x.dart';
import 'package:colartive2/features/canvas_live/views/components/canvas/canvas_live_card.dart';
import 'package:colartive2/features/canvas_live/views/components/color/panel/selected_color_panel.dart';
import 'package:colartive2/features/template/views/template_controller.dart';
import 'package:colartive2/utils/components/widgets/async_switcher.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'components/color/grid/color_button_grid.dart';

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
                      child: AnimatedSwitcher(
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
                        child: ColorButtonGrid(
                          template: template,
                        ),

                        //  modeIndex == 1
                        //     ? Container(
                        //         key: const ValueKey('featurePanel'),
                        //         height: height * 0.18,
                        //         width: width,
                        //         alignment: Alignment.center,
                        //         decoration: BoxDecoration(
                        //           color: darkModeFlag ? jetBlack : lightModeBgColor,
                        //         ),
                        //         child: Row(
                        //             mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //             children: _featurePanelLower()),
                        //       )
                        //     : modeIndex == 0
                        //         ? Container(
                        //             key: const ValueKey('textPanel'),
                        //             height: height * 0.18,
                        //             width: width,
                        //             alignment: AlignmentDirectional.center,
                        //             decoration: BoxDecoration(
                        //               color: darkModeFlag ? jetBlack : lightModeBgColor,
                        //             ),
                        //             child: GridView.count(
                        //               padding: EdgeInsets.only(
                        //                 top: height * 0.01,
                        //                 bottom: height * 0.01,
                        //                 left: width * 0.0,
                        //                 right: width * 0.0,
                        //               ),
                        //               crossAxisSpacing: width * 0.02,
                        //               mainAxisSpacing: width * 0.0,
                        //               crossAxisCount: 2,
                        //               childAspectRatio: (width / height) + 0.19,
                        //               scrollDirection: Axis.horizontal,
                        //               physics: const BouncingScrollPhysics(),
                        //               children: _textPanelLower(state),
                        //             ),
                        //           )
                        // :
                      ),
                    ),
                  ],
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
