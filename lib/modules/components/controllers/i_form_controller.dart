import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'i_base_controller.dart';

abstract class IFormController<P> extends IBaseController<P> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  final RxBool _isObscure = true.obs;
  bool get isObscure => _isObscure.value;
  set isObscure(value) => _isObscure(value);

  final focusNode = FocusNode(skipTraversal: true);

  @override
  void onClose() {
    focusNode.dispose();
    super.onClose();
  }

  Future<void> submitForm();

  void toggleObscure() {
    _isObscure.value = !_isObscure.value;
  }

  void updateValidationMode() {
    autoValidateMode = AutovalidateMode.onUserInteraction;
    update(['UPDATE_FORM']);
  }
}
