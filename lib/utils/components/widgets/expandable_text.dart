import 'package:colartive2/extensions/context_x.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final int trimLines;
  final TextStyle? style;

  const ExpandableText(this.text, {super.key, this.trimLines = 2, this.style});

  @override
  ExpandableTextState createState() => ExpandableTextState();
}

class ExpandableTextState extends State<ExpandableText> {
  bool _readMore = true;
  void _onTapLink() {
    setState(() => _readMore = !_readMore);
  }

  @override
  Widget build(BuildContext context) {
    final colorClickableText = context.colors.primary;
    final style = widget.style ?? DefaultTextStyle.of(context).style;
    TextSpan link = TextSpan(
        text: _readMore ? "...read more" : " read less",
        style: style.copyWith(
          color: colorClickableText,
        ),
        recognizer: TapGestureRecognizer()..onTap = _onTapLink);
    Widget result = LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        assert(constraints.hasBoundedWidth);
        final double maxWidth = constraints.maxWidth;
        // Create a TextSpan with data
        final text = TextSpan(
          text: widget.text,
          style: style,
        );
        // Layout and measure link
        TextPainter textPainter = TextPainter(
          text: link,
          textDirection: TextDirection.ltr,
          maxLines: widget.trimLines,
          ellipsis: '...',
        );
        textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
        final linkSize = textPainter.size;
        // Layout and measure text
        textPainter.text = text;
        textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
        final textSize = textPainter.size;
        // Get the endIndex of data
        int? endIndex;
        final pos = textPainter.getPositionForOffset(Offset(
          textSize.width - linkSize.width,
          textSize.height,
        ));
        endIndex = textPainter.getOffsetBefore(pos.offset);
        TextSpan textSpan;
        if (textPainter.didExceedMaxLines) {
          textSpan = TextSpan(
            text: _readMore ? widget.text.substring(0, endIndex) : widget.text,
            style: style,
            children: <TextSpan>[link],
          );
        } else {
          textSpan = TextSpan(
            text: widget.text,
            style: style,
          );
        }
        return RichText(
          softWrap: true,
          overflow: TextOverflow.clip,
          text: textSpan,
        );
      },
    );
    return result;
  }
}
