import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          onPressed: leftButtonAction ?? () => Get.back(result: false),
          child: Text(leftButtonTitle ?? "Cancel"),
        ),
        TextButton(
          onPressed: rightButtonAction ?? () => Get.back(result: true),
          child: Text(rightButtonTitle ?? "OK"),
        ),
      ],
    ),
  );
  return result ?? false;
}
