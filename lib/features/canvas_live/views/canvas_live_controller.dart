import 'package:colartive2/features/canvas_live/controller/canvas_live_mode_controller.dart';
import 'package:colartive2/features/canvas_live/model/variation.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final variationNotifierProvider =
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

  void addColor(Color color) {
    state = state.copyWith(colors: [color, ...state.colors]);
    animatedListKey.currentState?.insertItem(0);
  }

  void removeColorAt(int index) {
    state = state.copyWith(colors: state.colors..removeAt(index));
    animatedListKey.currentState
        ?.removeItem(index, (_, __) => const SizedBox());
  }

  void updateScaleFactore(double scale) {
    state = state.copyWith(scaleFactor: scale);
  }

  void updateRotation(double rotation) {
    state = state.copyWith(rotationFactor: rotation);
  }

  void updateBlur(double blur) {
    state = state.copyWith(blurFactor: blur);
  }

  void clear() {
    state = const Variation.empty();
    animatedListKey.currentState?.removeAllItems((_, __) => const SizedBox());
  }
}
