import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../themes/app_sizes.dart';
import '../controllers/i_form_controller.dart';
import '../popups/custom_dialog.dart';
import 'base_scaffold.dart';

class FormScaffold<C extends IFormController> extends GetView<C> {
  final String? title;
  final Widget? titleWidget;
  final double? titleSpacing;
  final bool? centerTitle;
  final double? appBarElevation;
  final Widget? drawer;
  final Widget? bottomNavigationBar;
  final bool resizeToAvoidBottomInset;
  final bool automaticallyImplyLeading;
  final PreferredSizeWidget? bottom;
  final Widget? floatingActionButton;
  final Widget? bottomSheet;
  final List<Widget>? persistentFooterButtons;

  final String? controllerTag;
  final List<Widget> Function(C controller) builder;
  final bool isUpdateForm;

  @override
  String? get tag => controllerTag;

  const FormScaffold({
    Key? key,
    this.controllerTag,
    required this.builder,
    this.isUpdateForm = true,
    this.title,
    this.titleWidget,
    this.centerTitle,
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // TODO: add title and subtitle
        return await showCustomDialog(
          context: context,
          title: "ABC",
          subTitle: "",
        );
      },
      child: Obx(() {
        return BaseScaffold(
          noPadding: true,
          isCancel: true,
          isLoading: controller.isLoading,
          title: title,
          titleSpacing: titleSpacing,
          titleWidget: titleWidget,
          centerTitle: centerTitle,
          appBarElevation: appBarElevation,
          automaticallyImplyLeading: automaticallyImplyLeading,
          bottom: bottom,
          drawer: drawer,
          bottomSheet: bottomSheet,
          bottomNavigationBar: bottomNavigationBar,
          floatingActionButton: floatingActionButton,
          persistentFooterButtons: persistentFooterButtons,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          actions: [
            TextButton(
              onPressed: () async {
                if (controller.formKey.currentState!.validate()) {
                  await controller.submitForm();
                } else {
                  controller.updateValidationMode();
                }
              },
              child: Text(isUpdateForm ? 'Save' : 'Submit'),
            ),
          ],
          child: GetBuilder<C>(
            id: 'UPDATE_FORM',
            tag: controllerTag,
            builder: (controller) {
              return Form(
                key: controller.formKey,
                autovalidateMode: controller.autoValidateMode,
                child: ListView(
                  padding: const EdgeInsets.all(AppSizes.smallPadding),
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  children: builder(controller),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
