import 'dart:io';

import 'package:colartive2/features/canvas/model/variation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ionicons/ionicons.dart';
import 'package:colartive2/features/canvas/views/canvas_full/canvas_full_controller.dart';
import 'package:colartive2/features/template/model/template.dart';

class CanvasFullBottomSheet extends HookConsumerWidget {
  final Size canvasSize;
  final Variation variation;
  final Template template;

  const CanvasFullBottomSheet({
    super.key,
    required this.canvasSize,
    required this.variation,
    required this.template,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dpr = MediaQuery.of(context).devicePixelRatio;

    final exportState = ref.watch(canvasExportProvider);
    final exportNotifier = ref.read(canvasExportProvider.notifier);
    final qualityState = useState(1);

    Color sheetColor =
        variation.colors.length >= 3 ? variation.colors[2] : Colors.blue;
    sheetColor = sheetColor.withValues(alpha: 0.9);
    final isBright =
        ThemeData.estimateBrightnessForColor(sheetColor) == Brightness.dark;
    final sheetItemColor =
        Color.lerp(sheetColor, isBright ? Colors.white : Colors.black, 0.25);

    Widget bottomSheetItem(
      Function onTap,
      String title,
      IconData icon,
    ) {
      return Expanded(
        child: GestureDetector(
          onTap: () async {
            await onTap();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: sheetItemColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                ),
                const SizedBox(height: 2.5),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }

    Widget qualityItem(String title, int value) {
      return Expanded(
        child: Row(
          children: <Widget>[
            Radio(
              value: value,
              groupValue: qualityState.value,
              activeColor: Colors.white,
              onChanged: (value) {
                if (value != null) qualityState.value = value;
              },
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        //indicator
        Container(
          height: 32,
          alignment: Alignment.center,
          child: Container(
            width: 128,
            height: 8,
            decoration: BoxDecoration(
              color: sheetColor,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        //sheet
        Container(
          decoration: BoxDecoration(
            color: sheetColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
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
                          color:
                              exportState.status == CanvasExportStatus.success
                                  ? Colors.green
                                  : Colors.red,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            exportState.message!,
                            style: TextStyle(
                              color: exportState.status ==
                                      CanvasExportStatus.success
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
                  Row(
                    children: [
                      bottomSheetItem(
                        () {
                          exportNotifier.downloadCanvas(
                            size: canvasSize,
                            dpr: dpr,
                            qltyValue: qualityState.value,
                            variation: variation,
                            template: template,
                          );
                        },
                        'Share to\nCommunity',
                        Icons.groups_3_outlined,
                      ),
                      SizedBox(width: 16),
                      bottomSheetItem(
                        () async {
                          await exportNotifier.downloadCanvas(
                            size: canvasSize,
                            dpr: dpr,
                            qltyValue: qualityState.value,
                            variation: variation,
                            template: template,
                          );
                        },
                        'Download\nWallpaper',
                        Icons.file_download,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  if (Platform.isAndroid) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        bottomSheetItem(
                          () async {
                            await exportNotifier.setAsHomeWallpaper(
                              size: canvasSize,
                              dpr: dpr,
                              qltyValue: qualityState.value,
                              variation: variation,
                              template: template,
                            );
                          },
                          'Home\nScreen',
                          Icons.wallpaper,
                        ),
                        const SizedBox(width: 16),
                        bottomSheetItem(
                          () async {
                            await exportNotifier.setAsLockWallpaper(
                              size: canvasSize,
                              dpr: dpr,
                              qltyValue: qualityState.value,
                              variation: variation,
                              template: template,
                            );
                          },
                          'Lock\nScreen',
                          Icons.lock,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                  Container(
                    decoration: BoxDecoration(
                      color: sheetItemColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Row(
                        children: [
                          qualityItem('HD', 0),
                          qualityItem('FHD', 1),
                          qualityItem('4K', 2),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
