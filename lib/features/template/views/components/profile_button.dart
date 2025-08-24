import 'package:colartive2/routes/app_navigation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileButton extends ConsumerWidget {
  const ProfileButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton.filledTonal(
      onPressed: () {
        context.goSettings();
      },
      icon: Icon(Icons.person),
    );
  }
}
