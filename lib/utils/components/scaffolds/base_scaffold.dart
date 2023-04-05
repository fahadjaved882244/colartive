import '../../../core_packages.dart';

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
    this.bottom,
  })  : assert(title != null || titleWidget != null),
        assert(!(title != null && titleWidget != null)),
        super(key: key);

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
        bottom: bottom,
      ),
      drawer: drawer,
      body: child,
      bottomSheet: bottomSheet,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      persistentFooterButtons: persistentFooterButtons,
    );
  }
}
