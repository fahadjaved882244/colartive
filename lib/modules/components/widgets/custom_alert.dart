import 'package:flutter/material.dart';

class CustomAlert extends StatelessWidget {
  final String message;
  final Color? backgroundColor;
  final Color? textColor;
  final double margin;
  final double paddingVert;
  final double paddingHorz;
  const CustomAlert(
    this.message, {
    Key? key,
    this.backgroundColor,
    this.textColor,
    this.margin = 16,
    this.paddingHorz = 16,
    this.paddingVert = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(margin),
      padding:
          EdgeInsets.symmetric(horizontal: paddingHorz, vertical: paddingVert),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color:
            backgroundColor ?? Theme.of(context).colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        message,
        style: TextStyle(
          color: textColor ?? Theme.of(context).colorScheme.onTertiaryContainer,
        ),
      ),
    );
  }
}
