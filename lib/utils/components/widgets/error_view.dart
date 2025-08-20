import 'package:flutter/material.dart';

import 'package:colartive2/routes/app_navigation.dart';
import 'package:colartive2/utils/components/widgets/custom_text.dart';
import 'package:colartive2/utils/core/app_sizes.dart';

class ErrorView extends StatelessWidget {
  final String message;
  const ErrorView({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            message,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: Paddings.sm),
          FilledButton(
            child: const CustomText('Back to home'),
            onPressed: () => context.goHome(),
          )
        ],
      ),
    );
  }
}
