import 'package:colartive2/features/canvas_live/controller/canvas_live_mode_controller.dart';
import 'package:colartive2/features/canvas_live/model/overlay_text.dart';
import 'package:colartive2/features/canvas_live/model/variation.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final canvasLiveControllerProvider =
    AutoDisposeNotifierProvider<VariationNotifier, Variation>(() {
  return VariationNotifier();
});

class VariationNotifier extends AutoDisposeNotifier<Variation> {
  late final GlobalKey<AnimatedListState> animatedListKey;
  @override
  Variation build() {
    animatedListKey = ref.watch(canvasLiveAnimatedListKeyProvider);
    return const Variation.empty();
  }

  // Color related methods
  void addColor(Color color) {
    state = state.copyWith(colors: [...state.colors, color]);
    animatedListKey.currentState?.insertItem(state.colors.length - 1);
  }

  void updateColor(int index, Color color) {
    state.colors[index] = color;
    state = state.copyWith(colors: state.colors);
  }

  void removeColorAt(int index) {
    if (index == state.colors.length - 1) {
      state = state.copyWith(colors: state.colors..removeAt(index));
      animatedListKey.currentState?.removeItem(
        index,
        (_, __) => const SizedBox(),
      );
    } else {
      state.colors[index] = const Color(0x00000000);
      state = state.copyWith(colors: state.colors);
    }
  }

  // Transformation related methods
  void updateScaleFactore(double scale) {
    state = state.copyWith(scaleFactor: scale);
  }

  void updateRotation(double rotation) {
    state = state.copyWith(rotationFactor: rotation);
  }

  void updateBlur(double blur) {
    state = state.copyWith(blurFactor: blur);
  }

  // OverlayText related methods
  void addText() {
    state = state.copyWith(
        overlayTexts: [...state.overlayTexts, const OverlayText.empty()]);
  }

  void updateTextValue(int index, String text) {
    if (index < 0 || index >= state.overlayTexts.length) return;
    state.overlayTexts[index] = state.overlayTexts[index].copyWith(text: text);
    state = state.copyWith(overlayTexts: state.overlayTexts);
  }

  void updateTextPosition(int index, double posX, double posY) {
    if (index < 0 || index >= state.overlayTexts.length) return;
    state.overlayTexts[index] =
        state.overlayTexts[index].copyWith(posX: posX, posY: posY);
    state = state.copyWith(overlayTexts: state.overlayTexts);
  }

  void updateTextRotation(int index, double rotation) {
    if (index < 0 || index >= state.overlayTexts.length) return;
    state.overlayTexts[index] =
        state.overlayTexts[index].copyWith(rotation: rotation);
    state = state.copyWith(overlayTexts: state.overlayTexts);
  }

  void updateTextFontSize(int index, double fontSize) {
    if (index < 0 || index >= state.overlayTexts.length) return;
    state.overlayTexts[index] =
        state.overlayTexts[index].copyWith(fontSize: fontSize);
    state = state.copyWith(overlayTexts: state.overlayTexts);
  }

  void updateTextFontFamily(int index, String fontFamily) {
    if (index < 0 || index >= state.overlayTexts.length) return;
    state.overlayTexts[index] =
        state.overlayTexts[index].copyWith(fontFamily: fontFamily);
    state = state.copyWith(overlayTexts: state.overlayTexts);
  }

  void updateTextColor(int index, Color color) {
    if (index < 0 || index >= state.overlayTexts.length) return;
    state.overlayTexts[index] =
        state.overlayTexts[index].copyWith(color: color);
    state = state.copyWith(overlayTexts: state.overlayTexts);
  }

  void removeTextAt(int index) {
    if (index == state.overlayTexts.length - 1) {
      state = state.copyWith(overlayTexts: state.overlayTexts..removeAt(index));
    }
  }

  void clear() {
    state = const Variation.empty();
    animatedListKey.currentState?.removeAllItems((_, __) => const SizedBox());
  }
}
