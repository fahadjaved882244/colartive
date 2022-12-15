import 'package:flutter/material.dart';

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
    Key? key,
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fgColor = selected
        ? Theme.of(context).colorScheme.onSecondaryContainer
        : Theme.of(context).colorScheme.onSurface;
    return ListTile(
      tileColor: tileColor,
      enabled: enabled,
      selected: selected,
      dense: dense,
      style: isDrawer ? ListTileStyle.drawer : ListTileStyle.list,
      title: title != null
          ? Text(
              title!,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: fgColor),
            )
          : titleWidget,
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant),
            )
          : subtitleWidget,
      leading: leading,
      trailing: implyTrailing ? const Icon(Icons.chevron_right) : trailing,
      onTap: onTap,
    );
  }
}
