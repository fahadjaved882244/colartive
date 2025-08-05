import 'package:flutter/material.dart';
import '../../../extensions/context_x.dart';

import 'custom_text.dart';

class CustomListTile extends StatelessWidget {
  final String? title;
  final Widget? titleWidget;
  final String? subtitle;
  final Widget? subtitleWidget;
  final VoidCallback? onTap;
  final bool enabled;
  final Widget? leading;
  final Widget? trailing;
  final bool implyTrailing;
  final Color? tileColor;
  final bool selected;
  final bool dense;
  final bool isDrawer;

  const CustomListTile({
    super.key,
    this.title,
    this.titleWidget,
    this.subtitle,
    this.subtitleWidget,
    this.onTap,
    this.tileColor,
    this.enabled = true,
    this.leading,
    this.trailing,
    this.implyTrailing = false,
    this.selected = false,
    this.dense = false,
    this.isDrawer = false,
  });

  @override
  Widget build(BuildContext context) {
    final fgColor = selected
        ? context.colors.onSecondaryContainer
        : context.colors.onSurface;
    return ListTile(
      tileColor: tileColor,
      enabled: enabled,
      selected: selected,
      dense: dense,
      style: isDrawer ? ListTileStyle.drawer : ListTileStyle.list,
      title: title != null
          ? CustomText(
              title!,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: fgColor),
            )
          : titleWidget,
      subtitle: subtitle != null
          ? CustomText(
              subtitle!,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: context.colors.onSurfaceVariant),
            )
          : subtitleWidget,
      leading: leading,
      trailing: implyTrailing ? const Icon(Icons.chevron_right) : trailing,
      onTap: onTap,
    );
  }
}
