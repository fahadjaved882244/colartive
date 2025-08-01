import 'package:colartive2/features/canvas_live/views/components/overlay_text/panel/overlay_text_info.dart';
import 'package:colartive2/features/canvas_live/views/components/overlay_text/panel/overlay_text_slider.dart';
import 'package:flutter/material.dart';

class OverlayTextPanel extends StatelessWidget {
  const OverlayTextPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Expanded(
          child: OverlayTextSlider(),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: width * 0.1,
          child: const OverlayTextInfo(),
        ),
      ],
    );
  }
}
