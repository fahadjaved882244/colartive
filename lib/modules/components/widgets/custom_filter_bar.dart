import 'package:colartive2/extensions/string_x.dart';
import 'package:flutter/material.dart';

import '../../../themes/app_sizes.dart';

class CustomFilterBar extends StatelessWidget implements PreferredSizeWidget {
  final List<String> filters;
  final String selectedFilter;
  final void Function(int) onSelected;
  const CustomFilterBar({
    Key? key,
    required this.filters,
    required this.selectedFilter,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.tabHeight,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.smallPadding),
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        separatorBuilder: (_, index) => const SizedBox(width: 8),
        itemBuilder: (_, index) => ChoiceChip(
          label: Text(filters[index].capFirst),
          selected: filters[index] == selectedFilter,
          onSelected: (_) {
            onSelected(index);
          },
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(AppSizes.tabHeight);
}
