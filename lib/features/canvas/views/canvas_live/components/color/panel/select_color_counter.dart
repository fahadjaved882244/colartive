import 'package:colartive2/features/canvas/views/canvas_live/canvas_live_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SelectedColorCounter extends ConsumerWidget {
  final int maxColors;
  const SelectedColorCounter({super.key, required this.maxColors});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(canvasLiveControllerProvider).colors.length;
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          right: Radius.circular(12),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Center(
        child: Text(
          "$count/$maxColors",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
