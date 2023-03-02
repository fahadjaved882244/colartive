import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:colartive2/extensions/string_x.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool enabled;
  final String? Function(String?)? validator;
  final void Function(String)? onSubmitted;
  final String? errorText;
  final TextInputAction textInputAction;
  final String? initialValue;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final bool readOnly;
  final bool onlyDigits;

  const CustomTextFormField({
    Key? key,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.focusNode,
    this.labelText,
    this.hintText,
    this.helperText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.errorText,
    this.textInputAction = TextInputAction.next,
    this.onSubmitted,
    this.initialValue,
    this.maxLines,
    this.onlyDigits = false,
    this.minLines,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      validator: (value) {
        final result = validator?.call(value);
        return result?.tr(context);
      },
      initialValue: initialValue,
      onFieldSubmitted: onSubmitted,
      obscureText: obscureText,
      enabled: enabled,
      readOnly: readOnly,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      maxLines: maxLines,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      minLines: minLines,
      maxLength: maxLength,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText?.tr(context),
        labelText: labelText?.tr(context),
        helperText: helperText?.tr(context),
      ),
      inputFormatters:
          onlyDigits ? [FilteringTextInputFormatter.digitsOnly] : [],
    );
  }
}
