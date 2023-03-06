import '../../../../../core_packages.dart';

import 'navigation_item/navigation_item.dart';

class CustomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onChanged;

  const CustomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(context) {
    return SafeArea(
      child: Container(
        height: 80,
        padding: const EdgeInsets.only(top: 13),
        decoration: BoxDecoration(
          color: context.colors.surface,
          border: Border(
            top: BorderSide(
              width: 1,
              color: context.colors.outline.withOpacity(0.25),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: navItems
              .map((item) => Expanded(
                    child: CustomNavigationItem(
                      item: item,
                      selectedIndex: selectedIndex,
                      onTap: onChanged,
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
