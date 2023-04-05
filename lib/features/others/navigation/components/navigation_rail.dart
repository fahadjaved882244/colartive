import 'package:colartive2/core_packages.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'navigation_item/navigation_item.dart';

const Widget _verticalSpacer = SizedBox(height: 20.0);

class CustomNavigationRail extends HookWidget {
  final int selectedIndex;
  final void Function(int) onChanged;

  final bool extended;
  final Widget? trailing;

  const CustomNavigationRail({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
    this.extended = false,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final isRTLDirection = Directionality.of(context) == TextDirection.rtl;
    return Container(
      width: extended ? 260 : 80,
      height: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: context.colors.surface,
        // border: Border(
        //   right: !isRTLDirection
        //       ? BorderSide(
        //           width: 1,
        //           color: context.colors.outline.withOpacity(0.25),
        //         )
        //       : BorderSide.none,
        //   left: isRTLDirection
        //       ? BorderSide(
        //           width: 1,
        //           color: context.colors.outline.withOpacity(0.25),
        //         )
        //       : BorderSide.none,
        // ),
      ),
      child: SafeArea(
        right: isRTLDirection,
        left: !isRTLDirection,
        child: Column(
          children: [
            ////////////////
            /// Leading ///
            ////////// ////
            // _verticalSpacer,
            // _Leading(extended: extended),
            // _verticalSpacer,
            // const Divider(),
            _verticalSpacer,
            ////////////////
            /// Body ///
            ////////// ////
            ...navItems
                .map((item) => Column(
                      children: [
                        CustomNavigationItem(
                          item: item,
                          selectedIndex: selectedIndex,
                          onTap: onChanged,
                          extended: extended,
                        ),
                        _verticalSpacer,
                      ],
                    ))
                .toList(),
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}

// class _Leading extends StatelessWidget {
//   final bool extended;
//   const _Leading({
//     required this.extended,
//   });

//   @override
//   Widget build(BuildContext context) {
//     if (extended) {
//       return ListTile(
//         contentPadding: const EdgeInsets.fromLTRB(16, 4, 24, 4),
//         dense: true,
//         title: Text(
//           "ColArtive",
//           style: context.textTheme.headlineLarge,
//         ),
//         trailing: Icon(
//           Ionicons.menu,
//           color: context.colors.onSurfaceVariant,
//         ),
//       );
//     } else {
//       return Icon(
//         Ionicons.menu,
//         color: context.colors.onSurfaceVariant,
//       );
//     }
//   }
// }
