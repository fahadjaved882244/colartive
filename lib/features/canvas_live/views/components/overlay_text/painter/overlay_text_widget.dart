import 'package:colartive2/features/canvas_live/controller/canvas_live_mode_controller.dart';
import 'package:colartive2/features/canvas_live/model/overlay_text.dart';
import 'package:colartive2/features/canvas_live/views/canvas_live_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OverlayTextWidget extends HookConsumerWidget {
  final int index;
  final OverlayText text;
  final Size canvasSize;
  final void Function(bool flag) canShowAxis;
  const OverlayTextWidget({
    required this.index,
    required this.text,
    required this.canvasSize,
    required this.canShowAxis,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController(text: text.text);
    final scopeNode = useFocusNode();
    final showSelected = useState(true);
    final lastRotation = useState(text.rotation);
    final lastFontSize = useState(text.fontSize);

    useEffect(() {
      controller.addListener(() {
        ref
            .read(canvasLiveControllerProvider.notifier)
            .updateTextValue(index, controller.text);
      });
      scopeNode.requestFocus();
      return null;
    }, []);

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final center = Offset(canvasSize.width / 2, canvasSize.height / 2);

    final textSize = calculateTextSize(text);
    final isSelected = scopeNode.hasFocus;

    return Positioned(
      left: (text.posX * canvasSize.width) - textSize.width * 0.625,
      top: (text.posY * canvasSize.height) - textSize.height * 0.625,
      child: Transform.rotate(
        angle: text.rotation,
        child: GestureDetector(
          onTap: () {
            if (ref.read(canvasLiveModeProvider) != CanvasLiveMode.text) {
              ref.read(canvasLiveModeProvider.notifier).state =
                  CanvasLiveMode.text;
            }
            scopeNode.requestFocus();
          },
          onScaleStart: (scaleDetails) {
            showSelected.value = false;
            lastRotation.value = text.rotation;
            lastFontSize.value = text.fontSize;
            canShowAxis(true);
          },
          onScaleUpdate: (details) {
            //manage text rotation
            final newRotation = lastRotation.value + details.rotation;
            ref
                .read(canvasLiveControllerProvider.notifier)
                .updateTextRotation(index, newRotation);

            //manage text scaling
            final newFontSize = lastFontSize.value * details.scale;
            if (newFontSize > 16 && newFontSize < 220) {
              ref
                  .read(canvasLiveControllerProvider.notifier)
                  .updateTextFontSize(index, newFontSize);
            }

            // //manage offset of text
            double x = details.focalPoint.dx - (width * 0.175);
            double y = details.focalPoint.dy - (height * 0.115);

            //snap to center
            if (x < center.dx + 6 && x > center.dx - 6) {
              x = canvasSize.width / 2;
            }
            if (y < center.dy + 6 && y > center.dy - 6) {
              y = canvasSize.height / 2;
            }
            //update the text position
            ref.read(canvasLiveControllerProvider.notifier).updateTextPosition(
                index, x / canvasSize.width, y / canvasSize.height);
          },
          onScaleEnd: (scaleEndDetails) {
            showSelected.value = true;
            canShowAxis(false);
          },
          child: Container(
            width: textSize.width < 75
                ? textSize.width + 20
                : textSize.width + (textSize.width / 4),
            height: textSize.height + (textSize.height / 4),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: isSelected && showSelected.value
                  ? Border.all(width: 2, color: Colors.blue)
                  : null,
            ),
            child: EditableText(
              controller: controller,
              focusNode: scopeNode,
              // autofocus: widget.isSelected,
              autocorrect: false,

              showCursor: true,
              maxLines: null,
              cursorColor: Colors.blue,
              backgroundCursorColor: Colors.grey,
              textAlign: TextAlign.center,
              scrollPadding: const EdgeInsets.all(0),
              scrollPhysics: const NeverScrollableScrollPhysics(),
              textInputAction: TextInputAction.newline,
              style: TextStyle(
                color: text.color,
                fontSize: text.fontSize,
                fontFamily: text.fontFamily,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Size calculateTextSize(OverlayText text) {
    final textStyle = TextStyle(
      color: text.color,
      fontSize: text.fontSize,
      fontFamily: text.fontFamily,
      fontWeight: FontWeight.bold,
    );
    final textSpan = TextSpan(
      text: text.text,
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
      maxLines: 20,
    );
    textPainter.layout();
    return Size(textPainter.width, textPainter.height);
  }
}
