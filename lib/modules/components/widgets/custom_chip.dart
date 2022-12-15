import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final IconData? icon;
  final VoidCallback? onTap;
  final double? elevation;

  const CustomChip({
    Key? key,
    required this.label,
    this.onTap,
    this.icon,
    this.isSelected = false,
    this.elevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      showCheckmark: false,
      selected: isSelected,
      elevation: elevation,
      label: Text(label),
      backgroundColor: Theme.of(context).colorScheme.surface,
      avatar: icon != null
          ? Icon(
              icon,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            )
          : null,
      onSelected: (_) {
        onTap?.call();
      },
    );
  }
}
