import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final TextInputType? keyboardType;
  final String? initialValue;
  final Widget? suffix;
  final Widget? prefix;
  final String? suffixText;
  final String? prefixText;
  final String? helperText;
  final String? toolTip;
  final bool small;
  final bool isLast;
  final int? maxLines;
  final bool enabled;
  final bool onlyDigits;
  final bool onlyDoubles;
  final bool nullable;
  final FocusNode? focusNode;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;

  const CustomTextField({
    Key? key,
    this.controller,
    this.labelText,
    this.hintText,
    this.keyboardType,
    this.initialValue,
    this.suffix,
    this.prefix,
    this.suffixText,
    this.prefixText,
    this.helperText,
    this.maxLines,
    this.isLast = false,
    this.enabled = true,
    this.onlyDigits = false,
    this.onlyDoubles = false,
    this.nullable = false,
    this.onTap,
    this.onChanged,
    this.onSubmitted,
    this.toolTip,
    this.focusNode,
    this.small = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      enabled: enabled,
      maxLines: maxLines,
      initialValue: initialValue,
      decoration: InputDecoration(
        suffixIcon: toolTip == null
            ? suffix
            : Tooltip(
                message: toolTip,
                triggerMode: TooltipTriggerMode.tap,
                showDuration: const Duration(seconds: 5),
                child: const Icon(Icons.info_outline),
              ),
        hintText: hintText,
        helperText: helperText,
        labelText: labelText,
        suffixText: suffixText,
        prefixText: prefixText,
        prefixIcon: prefix,
      ),
      textInputAction: isLast ? TextInputAction.done : TextInputAction.next,
      keyboardType: keyboardType,
      inputFormatters: onlyDoubles
          ? [FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}$'))]
          : onlyDigits
              ? [FilteringTextInputFormatter.allow(RegExp(r'^(\d*)$'))]
              : [],
      validator: (value) {
        if (!nullable && (value == null || value.isEmpty)) {
          return 'Required';
        }
        if (onlyDigits && value!.startsWith(".")) {
          return "Decimal must start with 0";
        }
        return null;
      },
      onTap: onTap,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
    );
  }
}
