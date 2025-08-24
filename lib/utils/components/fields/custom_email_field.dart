import 'package:colartive2/utils/core/text_validator.dart';
import 'package:flutter/material.dart';
import 'package:colartive2/extensions/string_x.dart';
import 'package:ionicons/ionicons.dart';

class CustomEmailField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final void Function(String)? onSubmitted;
  final String? errorText;
  final TextInputAction textInputAction;

  const CustomEmailField({
    super.key,
    this.controller,
    this.focusNode,
    this.labelText,
    this.hintText,
    this.helperText,
    this.errorText,
    this.textInputAction = TextInputAction.next,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofillHints: [AutofillHints.email, AutofillHints.username],
      controller: controller,
      focusNode: focusNode,
      validator: TextValidator.emailValidator,
      onFieldSubmitted: onSubmitted,
      textInputAction: textInputAction,
      keyboardType: TextInputType.emailAddress,
      maxLines: 1,
      decoration: InputDecoration(
        prefixIcon: const Icon(Ionicons.mail_outline),
        hintText: hintText?.tr(context),
        labelText: labelText?.tr(context),
        helperText: helperText?.tr(context),
      ),
    );
  }
}
