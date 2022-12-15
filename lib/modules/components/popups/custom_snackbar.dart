import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void showCustomSnackBar<T>(
  final String message, {
  final String? title,
  final bool isError = false,
  final bool isSuccess = false,
}) {
  final context = Get.context!;
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null)
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onInverseSurface,
                  ),
            ),
          Text(
            message,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onInverseSurface,
                ),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.inverseSurface,
    ),
  );
}
