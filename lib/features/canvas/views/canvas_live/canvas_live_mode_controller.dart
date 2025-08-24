import 'package:hooks_riverpod/hooks_riverpod.dart';

/// The `CanvasLiveMode` enum represents the different modes available in the
/// canvas live editing feature. This enum is used to determine the current
/// mode of the canvas, which can be one of the following:
///
/// - `color`: This mode allows the user to change the color of elements on
///   the canvas.
///
/// - `text`: This mode enables the user to add, edit, and format text on
///   the canvas.
///
/// - `transformation`: This mode allows the user to transform elements on
///   the canvas, such as resizing, rotating, and moving objects.
///

enum CanvasLiveMode {
  color,
  transformation,
  text,
}

final canvasLiveModeProvider = AutoDisposeStateProvider<CanvasLiveMode>((ref) {
  return CanvasLiveMode.color;
});

/// The `colorMode` variable determines the look of Color Button Grid.
///
/// It can have one of the following values:
/// - `swatch`: This mode uses will group the colors under color swatched.
/// - `single`: This mode uses will display all the colors in the grid at once.
///
/// The `canvasLiveColorModeProvider` is a state provider that holds the current
/// mode of the [ColorButtonGrid]. It is initialized to `CanvasLiveMode.group` by default
/// and can be updated to switch between different modes from [SettingsView].

enum CanvasLiveColorMode {
  swatch,
  single,
}

final canvasLiveColorModeProvider =
    AutoDisposeStateProvider<CanvasLiveColorMode>((ref) {
  return CanvasLiveColorMode.swatch;
});

final canvasLiveHintProvider = AutoDisposeStateProvider<int?>((ref) {
  return null;
});

// Transformation Mode
enum CanvasLiveTransformationMode {
  scale,
  rotate,
  blur,
}

final canvasLiveTransformationModeProvider =
    AutoDisposeStateProvider<CanvasLiveTransformationMode>((ref) {
  return CanvasLiveTransformationMode.scale;
});

// Text Mode
enum CanvasLiveTextMode {
  add,
  remove,
  fontSize,
  color,
  fontFamily,
  rotate,
  format,
  position,
}

final canvasLiveTextModeProvider =
    AutoDisposeStateProvider<CanvasLiveTextMode>((ref) {
  return CanvasLiveTextMode.add;
});

// selected text index
final canvasLiveSelectedTextProvider = AutoDisposeStateProvider<int?>((ref) {
  return null;
});
