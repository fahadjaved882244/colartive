import 'package:colartive2/core_packages.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../popups/custom_dialog.dart';
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
  final List<Widget> children;
  final VoidCallback? onSubmitted;
  final bool isLoading;

  FormScaffold({
    Key? key,
    required this.children,
    required this.onSubmitted,
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

    return WillPopScope(
      onWillPop: () async {
        return await showCustomDialog(
          context: context,
          title: "Exit form?",
          subTitle: "Are you sure, If you exit all the changes will be lost.",
        );
      },
      child: BaseScaffold(
        noPadding: true,
        isCancel: true,
        title: title,
        titleSpacing: titleSpacing,
        titleWidget: titleWidget,
        centerTitle: centerTitle,
        appBarElevation: appBarElevation,
        bottomSheet: bottomSheet,
        persistentFooterButtons: persistentFooterButtons,
        actions: [
          TextButton(
            onPressed: !isLoading && onSubmitted != null
                ? () {
                    if (_formKey.currentState?.validate() ?? false) {
                      onSubmitted?.call();
                    } else {
                      autoValidateMode.value =
                          AutovalidateMode.onUserInteraction;
                    }
                  }
                : null,
            child: isLoading
                ? const CircularProgressIndicator()
                : Text(isUpdateForm ? AppStrings.save : AppStrings.submit),
          ),
        ],
        child: Form(
          key: _formKey,
          autovalidateMode: autoValidateMode.value,
          child: ListView(
            padding: const EdgeInsets.all(Paddings.sm),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: children,
          ),
        ),
      ),
    );
  }
}
