import 'package:colartive2/extensions/context_x.dart';
import 'package:flutter/material.dart';
import 'package:colartive2/extensions/string_x.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';

import '../../core/app_colors.dart';

class CustomPasswordField extends HookWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final String? Function(String?)? validator;
  final void Function(String)? onSubmitted;
  final TextInputAction textInputAction;

  const CustomPasswordField({
    Key? key,
    this.controller,
    this.validator,
    this.focusNode,
    this.labelText,
    this.hintText,
    this.helperText,
    this.textInputAction = TextInputAction.next,
    this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isObscure = useState(true);

    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      validator: (value) {
        final result = validator?.call(value);
        return result?.tr(context);
      },
      onFieldSubmitted: onSubmitted,
      obscureText: isObscure.value,
      textInputAction: textInputAction,
      keyboardType: TextInputType.visiblePassword,
      maxLines: 1,
      decoration: InputDecoration(
        prefixIcon: const Icon(Ionicons.lock_closed_outline),
        suffixIcon: IconButton(
          onPressed: () => isObscure.value = !isObscure.value,
          icon: Icon(
            isObscure.value ? Ionicons.eye_off_outline : Ionicons.eye_outline,
            color:
                isObscure.value ? AppColors.darkGray : context.colors.primary,
          ),
        ),
        hintText: hintText,
        labelText: labelText?.tr(context),
        helperText: helperText?.tr(context),
      ),
    );
  }
}
