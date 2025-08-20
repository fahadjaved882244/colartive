import 'package:colartive2/utils/components/widgets/custom_text.dart';
import 'package:colartive2/utils/core/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BaseScaffold extends StatelessWidget {
  final String? title;
  final Widget? titleWidget;
  final double? titleSpacing;
  final bool? centerTitle;
  final List<Widget>? actions;
  final double? appBarElevation;
  final Widget? drawer;
  final Widget? bottomNavigationBar;
  final Widget child;
  final bool resizeToAvoidBottomInset;
  final bool noPadding;
  final bool isCancel;
  final bool automaticallyImplyLeading;
  final PreferredSizeWidget? bottom;
  final Widget? floatingActionButton;
  final Widget? bottomSheet;
  final List<Widget>? persistentFooterButtons;

  const BaseScaffold({
    super.key,
    required this.child,
    this.title,
    this.titleWidget,
    this.centerTitle,
    this.actions,
    this.drawer,
    this.appBarElevation,
    this.titleSpacing,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.persistentFooterButtons,
    this.bottomSheet,
    this.automaticallyImplyLeading = true,
    this.resizeToAvoidBottomInset = true,
    this.noPadding = false,
    this.isCancel = false,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: AppBar(
        titleSpacing: titleSpacing,
        elevation: appBarElevation,
        title: titleWidget ?? CustomText(title!),
        centerTitle: centerTitle,
        actions: actions,
        automaticallyImplyLeading: automaticallyImplyLeading,
        leading: isCancel && context.canPop()
            ? IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => context.pop(),
              )
            : null,
        bottom: bottom,
      ),
      drawer: drawer,
      body: SafeArea(
        child: Padding(
          padding: !noPadding
              ? const EdgeInsets.symmetric(
                  vertical: Paddings.xs,
                  horizontal: Paddings.sm,
                )
              : EdgeInsets.zero,
          child: child,
        ),
      ),
      bottomSheet: bottomSheet,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      persistentFooterButtons: persistentFooterButtons,
    );
  }
}
