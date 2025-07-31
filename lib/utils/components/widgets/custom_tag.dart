import 'package:flutter/material.dart';
import '../../../extensions/context_x.dart';

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
    super.key,
    required this.text,
    this.paddingHorizontal = 10,
    this.paddingVertical = 4,
    this.margin,
    this.isRequired = true,
    this.id,
    this.forceBgColor,
    this.forceFgColor,
  });
  @override
  Widget build(BuildContext context) {
    final bgColor = isRequired
        ? context.colors.primaryContainer.withValues(alpha: 0.5)
        : context.colors.tertiaryContainer.withValues(alpha: 0.5);
    final fgColor =
        isRequired ? context.colors.primary : context.colors.tertiary;
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
