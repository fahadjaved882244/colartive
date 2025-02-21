import 'package:flutter/material.dart';

class TransformationPanelInfo extends StatelessWidget {
  const TransformationPanelInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(8),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Text(
        "100.0",
        // design.canChangeSize && changeSize
        //     ? vecSize.toStringAsPrecision(2)
        //     : design.blurAvailable && blurFlag
        //         ? blurSliderValue.toStringAsPrecision(2)
        //         : rotationFlag
        //             ? (rotationValue * 360).toStringAsPrecision(3)
        //             : '0.0',
      ),
    );
  }
}
