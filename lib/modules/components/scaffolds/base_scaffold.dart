import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import '../../../themes/app_sizes.dart';

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
  final bool isLoading;
  final bool noPadding;
  final bool isCancel;
  final bool automaticallyImplyLeading;
  final PreferredSizeWidget? bottom;
  final Widget? floatingActionButton;
  final Widget? bottomSheet;
  final List<Widget>? persistentFooterButtons;

  const BaseScaffold({
    Key? key,
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
    this.isLoading = false,
    this.noPadding = false,
    this.isCancel = false,
    this.bottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isLoading) return false;
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        appBar: AppBar(
          titleSpacing: titleSpacing,
          elevation: appBarElevation,
          title: titleWidget ?? Text(title!),
          centerTitle: centerTitle,
          actions: actions,
          automaticallyImplyLeading: automaticallyImplyLeading,
          leading: isCancel
              ? IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    if (!isLoading) Get.back();
                  },
                )
              : null,
          bottom: bottom,
        ),
        drawer: drawer,
        body: Column(
          children: [
            if (isLoading) const LinearProgressIndicator(),
            Expanded(
              child: IgnorePointer(
                ignoring: isLoading,
                child: Padding(
                  padding: noPadding
                      ? EdgeInsets.zero
                      : const EdgeInsets.all(AppSizes.smallPadding),
                  child: child,
                ),
              ),
            ),
          ],
        ),
        bottomSheet: bottomSheet,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
        persistentFooterButtons: persistentFooterButtons,
      ),
    );
  }
}
