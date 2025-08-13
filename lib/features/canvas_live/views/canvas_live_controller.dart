import 'package:colartive2/features/canvas_live/controller/canvas_live_mode_controller.dart';
import 'package:colartive2/features/canvas_live/model/overlay_text.dart';
import 'package:colartive2/features/canvas_live/model/variation.dart';
import 'package:colartive2/utils/core/stack_collection.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final canvasLiveControllerProvider =
    NotifierProvider.autoDispose<VariationNotifier, Variation>(() {
  return VariationNotifier();
});

class VariationNotifier extends AutoDisposeNotifier<Variation> {
  late final GlobalKey<AnimatedListState> animatedListKey;

  late final StackCollection<Variation> _undoStack;
  late final StackCollection<Variation> _redoStack;
  @override
  Variation build() {
    animatedListKey = ref.watch(canvasLiveAnimatedListKeyProvider);

    _undoStack = StackCollection<Variation>();
    _redoStack = StackCollection<Variation>();

    return const Variation.empty();
  }

  @override
  set state(Variation value) {
    _undoStack.push(super.state);
    _redoStack.clear();

    super.state = value;
  }

  // Color related methods
  void addColor(Color color) {
    state = state.copyWith(colors: [...state.colors, color]);
    animatedListKey.currentState?.insertItem(state.colors.length - 1);
  }

  void updateColor(int index, Color color) {
    state.colors.replaceRange(index, index + 1, [color]);
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

  void removeText() {
    final index = ref.read(canvasLiveSelectedTextProvider);
    if (index != null && index >= 0 && index < state.overlayTexts.length) {
      state = state.copyWith(overlayTexts: state.overlayTexts..removeAt(index));

      // Remove the selected text index
      ref.read(canvasLiveSelectedTextProvider.notifier).state = null;

      // Reset the text mode to none
      ref.read(canvasLiveTextModeProvider.notifier).state =
          CanvasLiveTextMode.add;
    }
  }

  void updateTextValue(int index, String text) {
    if (index < 0 || index >= state.overlayTexts.length) return;
    if (text != state.overlayTexts[index].text) {
      state.overlayTexts[index] =
          state.overlayTexts[index].copyWith(text: text);
      state = state.copyWith(overlayTexts: state.overlayTexts);
    }
  }

  void updateTextPosition(int index, double posX, double posY) {
    if (index < 0 || index >= state.overlayTexts.length) return;
    state.overlayTexts[index] =
        state.overlayTexts[index].copyWith(posX: posX, posY: posY);
    state = state.copyWith(overlayTexts: state.overlayTexts);
  }

  void updateTextRotation(double rotation) {
    final index = ref.read(canvasLiveSelectedTextProvider);
    if (index != null && index >= 0 && index < state.overlayTexts.length) {
      state.overlayTexts[index] =
          state.overlayTexts[index].copyWith(rotation: rotation);
      state = state.copyWith(overlayTexts: state.overlayTexts);
    }
  }

  void updateTextFontSize(int index, double fontSize) {
    if (index < 0 || index >= state.overlayTexts.length) return;
    state.overlayTexts[index] =
        state.overlayTexts[index].copyWith(fontSize: fontSize);
    state = state.copyWith(overlayTexts: state.overlayTexts);
  }

  void updateTextFontFamily(String fontFamily) {
    final index = ref.read(canvasLiveSelectedTextProvider);
    if (index != null && index >= 0 && index < state.overlayTexts.length) {
      state.overlayTexts[index] =
          state.overlayTexts[index].copyWith(fontFamily: fontFamily);
      state = state.copyWith(overlayTexts: state.overlayTexts);
    }
  }

  void updateTextColor(Color color) {
    final index = ref.read(canvasLiveSelectedTextProvider);
    if (index != null && index >= 0 && index < state.overlayTexts.length) {
      state.overlayTexts[index] =
          state.overlayTexts[index].copyWith(color: color);
      state = state.copyWith(overlayTexts: state.overlayTexts);
    }
  }

  void clear() {
    state = const Variation.empty();
    animatedListKey.currentState?.removeAllItems((_, __) => const SizedBox());
    _undoStack.clear();
    _redoStack.clear();
  }

  // Undo/Redo methods
  bool get canUndo => _undoStack.isNotEmpty;
  bool get canRedo => _redoStack.isNotEmpty;

  void undo() {
    if (_undoStack.isNotEmpty) {
      final lastState = _undoStack.pop();
      _redoStack.push(state);
      if (lastState != null) {
        super.state = lastState;
      }
    }
  }

  void redo() {
    if (_redoStack.isNotEmpty) {
      final lastState = _redoStack.pop();
      _undoStack.push(state);
      if (lastState != null) {
        super.state = lastState;
      }
    }
  }
}
