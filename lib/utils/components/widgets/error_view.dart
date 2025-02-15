import 'package:colartive2/routes/app_paths.dart';
import 'package:colartive2/utils/components/widgets/custom_text.dart';
import 'package:colartive2/utils/core/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorView extends StatelessWidget {
  final String message;
  const ErrorView({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: Paddings.sm),
          FilledButton(
            child: const CustomText('Back to home'),
            onPressed: () => context.go(AppPaths.home),
          )
        ],
      ),
    );
  }
}
