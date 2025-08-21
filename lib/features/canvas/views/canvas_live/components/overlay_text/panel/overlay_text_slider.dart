import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:colartive2/features/canvas/views/canvas_live/canvas_live_controller.dart';
import 'package:colartive2/features/canvas/model/overlay_text.dart';
import 'package:colartive2/features/canvas/views/canvas_live/canvas_live_mode_controller.dart';

class OverlayTextSlider extends ConsumerWidget {
  const OverlayTextSlider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(canvasLiveTextModeProvider);

    final overlayTextList =
        ref.watch(canvasLiveControllerProvider).overlayTexts;
    final index = ref.watch(canvasLiveSelectedTextProvider);
    final overlayText = index != null ? overlayTextList[index] : null;

    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          right: (mode == CanvasLiveTextMode.rotate ||
                  mode == CanvasLiveTextMode.fontSize)
              ? Radius.circular(12)
              : Radius.circular(0),
        ),
      ),
      child: overlayText != null
          ? _toggleSlider(
              ref: ref,
              index: index!,
              overlayText: overlayText,
              mode: mode,
            )
          : Center(
              child: Text(
                "Click on 'Add' to start writing!",
                style: TextStyle(
                  wordSpacing: 3,
                ),
              ),
            ),
    );
  }

  Widget _toggleSlider({
    required WidgetRef ref,
    required int index,
    required OverlayText overlayText,
    required CanvasLiveTextMode mode,
  }) {
    switch (mode) {
      case CanvasLiveTextMode.fontSize:
        return Slider(
          min: 12,
          max: 100,
          value: overlayText.fontSize,
          onChanged: (value) {
            ref
                .read(canvasLiveControllerProvider.notifier)
                .updateTextFontSize(index, value);
          },
        );

      case CanvasLiveTextMode.rotate:
        return Slider(
          value: overlayText.rotation,
          onChanged: (value) {
            ref
                .read(canvasLiveControllerProvider.notifier)
                .updateTextRotation(value);
          },
        );

      case CanvasLiveTextMode.color:
        final colors = [
          Colors.black,
          Colors.white,
          Colors.red,
          Colors.green,
          Colors.blue,
          Colors.yellow,
          Colors.orange,
          Colors.purple,
          Colors.pink,
          Colors.brown,
          Colors.grey,
        ];

        return ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: colors.length,
          itemBuilder: (context, index) {
            final color = colors[index];
            final isSelected = overlayText.color == color;

            final brightness = ThemeData.estimateBrightnessForColor(color);
            final iconColor =
                brightness == Brightness.light ? Colors.black : Colors.white;
            return Material(
              color: color,
              shape: CircleBorder(),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () {
                  ref
                      .read(canvasLiveControllerProvider.notifier)
                      .updateTextColor(color);
                },
                child: SizedBox.square(
                  dimension: isSelected ? 48 : 40,
                  child: isSelected
                      ? Icon(
                          Icons.check,
                          color: iconColor,
                        )
                      : null,
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 8),
        );

      case CanvasLiveTextMode.fontFamily:
        final fontFamilies = [
          "Lobster",
          "Open Sans",
          "Montserrat",
          "Baskervville",
          "Cinzel Decorative",
          "Dancing Script",
          "Fredoka One",
          "Kaushan Script",
          "Megrim",
          "Monoton",
          "Nosifer",
          "Orbitron",
          "Rock Salt",
          "Shojumaru",
          "Trade Winds",
          "Zilla Slab Highlight",
          "Beware",
          "Border Base",
          "October Crow",
          "Praaminobenzoic",
          "Freak Show",
          "Bungee Inline"
        ];

        return ListView.separated(
          key: const PageStorageKey('fontFamily'),
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          itemCount: fontFamilies.length,
          itemBuilder: (context, index) {
            final fontFamily = fontFamilies[index];
            final isSelected = overlayText.fontFamily == fontFamily;
            return ChoiceChip(
              label: Text(
                "Style",
                style: TextStyle(
                  fontFamily: fontFamily,
                  fontSize: 16,
                ),
              ),
              selected: isSelected,
              onSelected: (selected) {
                if (selected) {
                  ref
                      .read(canvasLiveControllerProvider.notifier)
                      .updateTextFontFamily(fontFamily);
                }
              },
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(width: 8);
          },
        );
      default:
        return Center(child: SizedBox());
    }
  }
}
