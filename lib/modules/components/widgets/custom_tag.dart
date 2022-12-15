import 'package:flutter/material.dart';

class CustomTag extends StatelessWidget {
  final int? id;
  final String text;
  final double paddingHorizontal;
  final double paddingVertical;
  final EdgeInsetsGeometry? margin;
  final bool isRequired;
  final Color? forceBgColor;
  final Color? forceFgColor;

  const CustomTag({
    Key? key,
    required this.text,
    this.paddingHorizontal = 10,
    this.paddingVertical = 4,
    this.margin,
    this.isRequired = true,
    this.id,
    this.forceBgColor,
    this.forceFgColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final bgColor = isRequired
        ? Theme.of(context).colorScheme.primaryContainer.withOpacity(0.5)
        : Theme.of(context).colorScheme.tertiaryContainer.withOpacity(0.5);
    final fgColor = isRequired
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.tertiary;
    return Container(
      margin: margin,
      padding: EdgeInsets.symmetric(
        horizontal: paddingHorizontal,
        vertical: paddingVertical,
      ),
      decoration: BoxDecoration(
        color: forceBgColor ?? bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.w700,
              color: forceFgColor ?? fgColor,
            ),
      ),
    );
  }
}
