import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ionicons/ionicons.dart';
import 'package:colartive2/features/canvas_full/providers/canvas_export_provider.dart';
import 'package:colartive2/features/canvas_live/model/variation.dart';
import 'package:colartive2/features/template/model/template.dart';

class CanvasActionsBottomSheet extends ConsumerWidget {
  final Size canvasSize;
  final Variation variation;
  final Template template;

  const CanvasActionsBottomSheet({
    super.key,
    required this.canvasSize,
    required this.variation,
    required this.template,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exportState = ref.watch(canvasExportProvider);
    final exportNotifier = ref.read(canvasExportProvider.notifier);

    return DraggableScrollableSheet(
      initialChildSize: 0.3,
      minChildSize: 0.2,
      maxChildSize: 0.6,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, -5),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 16),
              if (exportState.message != null) ...[
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: exportState.status == CanvasExportStatus.success
                        ? Colors.green[50]
                        : Colors.red[50],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: exportState.status == CanvasExportStatus.success
                          ? Colors.green
                          : Colors.red,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        exportState.status == CanvasExportStatus.success
                            ? Ionicons.checkmark_circle
                            : Ionicons.alert_circle,
                        color: exportState.status == CanvasExportStatus.success
                            ? Colors.green
                            : Colors.red,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          exportState.message!,
                          style: TextStyle(
                            color:
                                exportState.status == CanvasExportStatus.success
                                    ? Colors.green[800]
                                    : Colors.red[800],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: exportNotifier.clearStatus,
                        icon: const Icon(Ionicons.close),
                        iconSize: 16,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],
              if (exportState.status == CanvasExportStatus.loading)
                const Center(
                  child: CircularProgressIndicator(),
                )
              else ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      _ActionButton(
                        icon: Ionicons.share_social_outline,
                        title: 'Share in Community',
                        onTap: () => exportNotifier.downloadCanvas(
                          size: canvasSize,
                          variation: variation,
                          template: template,
                        ),
                      ),
                      _ActionButton(
                        icon: Ionicons.download_outline,
                        title: 'Save',
                        onTap: () => exportNotifier.downloadCanvas(
                          size: canvasSize,
                          variation: variation,
                          template: template,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _ActionButton(
                      icon: Ionicons.home_outline,
                      title: 'Home Wallpaper',
                      onTap: () => exportNotifier.setAsHomeWallpaper(
                        size: canvasSize,
                        variation: variation,
                        template: template,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _ActionButton(
                      icon: Ionicons.lock_closed_outline,
                      title: 'Lock Screen',
                      onTap: () => exportNotifier.setAsLockWallpaper(
                        size: canvasSize,
                        variation: variation,
                        template: template,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonalIcon(
      onPressed: () {},
      icon: Icon(icon),
      label: Text(title),
    );
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: Colors.blue[600],
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                      fontFamily: 'Sans Serif',
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Ionicons.chevron_forward,
              color: Colors.grey[400],
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
