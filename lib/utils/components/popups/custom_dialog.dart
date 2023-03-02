import 'package:colartive2/core_packages.dart';

Future<bool> showCustomDialog({
  required BuildContext context,
  required String title,
  required String subTitle,
  String? leftButtonTitle,
  void Function()? leftButtonAction,
  String? rightButtonTitle,
  void Function()? rightButtonAction,
}) async {
  final result = await showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: Text(subTitle),
      actions: [
        TextButton(
          onPressed: leftButtonAction ?? () => Navigator.of(context).pop(false),
          child: CustomText(leftButtonTitle ?? AppStrings.cancel),
        ),
        TextButton(
          onPressed: rightButtonAction ?? () => Navigator.of(context).pop(true),
          child: CustomText(rightButtonTitle ?? AppStrings.ok),
        ),
      ],
    ),
  );
  return result ?? false;
}
