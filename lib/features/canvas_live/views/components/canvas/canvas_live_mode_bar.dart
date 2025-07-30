import 'package:colartive2/extensions/context_x.dart';
import 'package:colartive2/features/canvas_live/controller/canvas_live_mode_controller.dart';
import 'package:colartive2/features/canvas_live/views/canvas_live_controller.dart';
import 'package:colartive2/utils/components/popups/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//////////////////////// FeatureBar ////////////////////////////

class FBItem {
  final String name;
  final String title;
  final String fontFamily;
  final CanvasLiveMode mode;
  const FBItem(this.name, this.title, this.fontFamily, this.mode);
}

const List<FBItem> items = [
  FBItem('Text', 'T', 'Baskervville', CanvasLiveMode.text),
  FBItem('Edit', 'E', 'Shojumaru', CanvasLiveMode.transformation),
  FBItem('Color', 'C', 'Lobster', CanvasLiveMode.color),
];

class CanvasLiveModeBar extends ConsumerWidget {
  const CanvasLiveModeBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedColors = ref.watch(canvasLiveControllerProvider).colors;
    final canvasMode = ref.watch(canvasLiveModeProvider);
    return Column(
      children: items.map((item) {
        return InkWell(
          onTap: () async {
            if (selectedColors.isNotEmpty && canvasMode != item.mode) {
              ref.read(canvasLiveModeProvider.notifier).state = item.mode;
            } else if (canvasMode != item.mode) {
              showCustomSnackBar(
                context,
                'Please select colors before accessing extra features.',
              );
            }
          },
          child: _buildFBItem(context, item, canvasMode == item.mode),
        );
      }).toList(),
    );
  }

  Widget _buildFBItem(BuildContext context, FBItem item, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
            padding: const EdgeInsets.all(8),
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
              color: isSelected
                  ? context.colorScheme.primary
                  : context.colorScheme.tertiaryContainer,
              shape: BoxShape.circle,
            ),
            child: Text(
              item.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isSelected
                    ? context.colorScheme.onPrimary
                    : context.colorScheme.onTertiaryContainer,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                fontFamily: item.fontFamily,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            item.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected
                  ? context.colorScheme.primary
                  : context.colorScheme.onSurface,
              fontWeight: FontWeight.w300,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}
