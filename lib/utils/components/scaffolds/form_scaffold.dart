import 'package:colartive2/core_packages.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'base_scaffold.dart';

class FormScaffold extends HookWidget {
  final String? title;
  final Widget? titleWidget;
  final double? titleSpacing;
  final bool? centerTitle;
  final double? appBarElevation;
  final Widget? bottomSheet;
  final List<Widget>? persistentFooterButtons;
  final bool isUpdateForm;
  final bool isLoading;
  final List<Widget> Function(
      BuildContext context,
      GlobalKey<FormState> formKey,
      ValueNotifier<AutovalidateMode> autovalidateMode) builder;

  FormScaffold({
    Key? key,
    required this.builder,
    this.isLoading = false,
    this.isUpdateForm = true,
    this.title,
    this.titleWidget,
    this.centerTitle,
    this.appBarElevation,
    this.titleSpacing,
    this.persistentFooterButtons,
    this.bottomSheet,
  }) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final autoValidateMode = useState(AutovalidateMode.disabled);

    return BaseScaffold(
      noPadding: true,
      title: title,
      isLoading: isLoading,
      titleSpacing: titleSpacing,
      titleWidget: titleWidget,
      centerTitle: centerTitle,
      appBarElevation: appBarElevation,
      bottomSheet: bottomSheet,
      persistentFooterButtons: persistentFooterButtons,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppSizes.maxWidth),
          child: Form(
            key: _formKey,
            autovalidateMode: autoValidateMode.value,
            child: ListView(
              padding: const EdgeInsets.all(Paddings.sm),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              children: builder(context, _formKey, autoValidateMode),
            ),
          ),
        ),
      ),
    );
  }
}
