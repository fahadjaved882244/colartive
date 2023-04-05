import 'package:colartive2/core_packages.dart';
import 'base_scaffold.dart';

class FormScaffold extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final AutovalidateMode autovalidateMode;
  final String? title;
  final Widget? titleWidget;
  final double? titleSpacing;
  final bool? centerTitle;
  final double? appBarElevation;
  final Widget? bottomSheet;
  final List<Widget>? persistentFooterButtons;

  final bool isLoading;
  final List<Widget> children;

  const FormScaffold({
    Key? key,
    required this.formKey,
    required this.autovalidateMode,
    required this.children,
    this.isLoading = false,
    this.title,
    this.titleWidget,
    this.centerTitle,
    this.appBarElevation,
    this.titleSpacing,
    this.persistentFooterButtons,
    this.bottomSheet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: title,
      titleSpacing: titleSpacing,
      titleWidget: titleWidget,
      centerTitle: centerTitle,
      appBarElevation: appBarElevation,
      bottomSheet: bottomSheet,
      persistentFooterButtons: persistentFooterButtons,
      child: Column(
        children: [
          if (isLoading) const LinearProgressIndicator(),
          Expanded(
            child: IgnorePointer(
              ignoring: isLoading,
              child: Center(
                child: ConstrainedBox(
                  constraints:
                      const BoxConstraints(maxWidth: AppSizes.maxWidth),
                  child: Form(
                    key: formKey,
                    autovalidateMode: autovalidateMode,
                    child: ListView(
                      padding: const EdgeInsets.all(Paddings.sm),
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      children: children,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
