import 'package:colartive2/extensions/string_x.dart';
import 'package:flutter/material.dart';

import '../../../themes/app_sizes.dart';

class CustomDropdownFormField<T extends Object> extends StatelessWidget {
  final String label;
  final T? value;
  final void Function(T?)? onChanged;
  final List<T> items;
  final String? Function(T?)? validator;

  const CustomDropdownFormField({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    required this.items,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      onChanged: onChanged,
      validator: validator,
      items: items.map((i) {
        return DropdownMenuItem(
          value: i,
          child: Text(i.toString().capFirst),
        );
      }).toList(),
      elevation: 2,
      isDense: true,
      menuMaxHeight: 300,
      style: Theme.of(context).textTheme.labelLarge,
      dropdownColor: Theme.of(context).colorScheme.surface,
      iconEnabledColor: Theme.of(context).colorScheme.onSurfaceVariant,
      decoration: InputDecoration(
        labelText: label,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
          borderRadius:
              const BorderRadius.all(Radius.circular(AppSizes.textFieldRadius)),
        ),
      ),
    );
  }
}
