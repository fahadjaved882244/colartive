import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gal/gal.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:colartive2/features/canvas_live/views/components/canvas/template_painter.dart';
import 'package:colartive2/features/canvas_live/model/variation.dart';
import 'package:colartive2/features/template/model/template.dart';
import 'package:wallpaper_manager_flutter/wallpaper_manager_flutter.dart';

final canvasExportProvider =
    AutoDisposeNotifierProvider<CanvasExportNotifier, CanvasExportState>(() {
  return CanvasExportNotifier();
});

enum CanvasExportStatus { idle, loading, success, error }

class CanvasExportState {
  final CanvasExportStatus status;
  final String? message;

  const CanvasExportState({
    this.status = CanvasExportStatus.idle,
    this.message,
  });

  CanvasExportState copyWith({
    CanvasExportStatus? status,
    String? message,
  }) {
    return CanvasExportState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}

class CanvasExportNotifier extends AutoDisposeNotifier<CanvasExportState> {
  @override
  CanvasExportState build() {
    return const CanvasExportState();
  }

  Future<void> downloadCanvas({
    required Size size,
    required double dpr,
    required int qltyValue,
    required Variation variation,
    required Template template,
  }) async {
    state = state.copyWith(status: CanvasExportStatus.loading);
    File? file;
    try {
      final hasPermission = await _requestStoragePermission();
      if (!hasPermission) {
        state = state.copyWith(
          status: CanvasExportStatus.error,
          message: 'Storage permission denied',
        );
        return;
      }

      final bytes = await _renderCanvasToBytes(
        size: size,
        dpr: dpr,
        qltyValue: qltyValue,
        variation: variation,
        template: template,
      );

      if (bytes == null) {
        state = state.copyWith(
          status: CanvasExportStatus.error,
          message: 'Failed to render canvas',
        );
        return;
      }

      final tempDir = await getTemporaryDirectory();
      final path =
          '${tempDir.path}/canvas_${DateTime.now().millisecondsSinceEpoch}.png';

      file = await File(path).writeAsBytes(bytes);

      await Gal.putImage(file.path);

      state = state.copyWith(
        status: CanvasExportStatus.success,
        message: 'Canvas downloaded successfully',
      );
    } on GalException catch (e) {
      state = state.copyWith(
        status: CanvasExportStatus.error,
        message: e.type.message,
      );
    } catch (e) {
      state = state.copyWith(
        status: CanvasExportStatus.error,
        message: 'Error: $e',
      );
    } finally {
      if (file != null && file.existsSync()) {
        await file.delete(recursive: true);
      }
    }
  }

  Future<void> setAsHomeWallpaper({
    required Size size,
    required double dpr,
    required int qltyValue,
    required Variation variation,
    required Template template,
  }) async {
    state = state.copyWith(status: CanvasExportStatus.loading);
    File? file;
    try {
      final bytes = await _renderCanvasToBytes(
        size: size,
        dpr: dpr,
        qltyValue: qltyValue,
        variation: variation,
        template: template,
      );

      if (bytes == null) {
        state = state.copyWith(
          status: CanvasExportStatus.error,
          message: 'Failed to render canvas',
        );
        return;
      }

      final tempDir = await getTemporaryDirectory();
      file = File(
          '${tempDir.path}/wallpaper_${DateTime.now().millisecondsSinceEpoch}.png');
      await file.writeAsBytes(bytes);

      final result = await WallpaperManagerFlutter().setWallpaper(
        file,
        WallpaperManagerFlutter.homeScreen,
      );

      if (result) {
        state = state.copyWith(
          status: CanvasExportStatus.success,
          message: 'Set as home screen wallpaper',
        );
      }
    } catch (e) {
      state = state.copyWith(
        status: CanvasExportStatus.error,
        message: 'Error: $e',
      );
    } finally {
      if (file != null && file.existsSync()) {
        await file.delete(recursive: true);
      }
    }
  }

  Future<void> setAsLockWallpaper({
    required Size size,
    required double dpr,
    required int qltyValue,
    required Variation variation,
    required Template template,
  }) async {
    state = state.copyWith(status: CanvasExportStatus.loading);
    File? file;
    try {
      final bytes = await _renderCanvasToBytes(
        size: size,
        dpr: dpr,
        qltyValue: qltyValue,
        variation: variation,
        template: template,
      );

      if (bytes == null) {
        state = state.copyWith(
          status: CanvasExportStatus.error,
          message: 'Failed to render canvas',
        );
        return;
      }

      final tempDir = await getTemporaryDirectory();
      file = File(
          '${tempDir.path}/wallpaper_${DateTime.now().millisecondsSinceEpoch}.png');
      await file.writeAsBytes(bytes);

      final result = await WallpaperManagerFlutter().setWallpaper(
        file,
        WallpaperManagerFlutter.lockScreen,
      );

      if (result) {
        state = state.copyWith(
          status: CanvasExportStatus.success,
          message: 'Set as lock screen wallpaper',
        );
      } else {
        state = state.copyWith(
          status: CanvasExportStatus.error,
          message: 'Failed to set wallpaper',
        );
      }
    } catch (e) {
      state = state.copyWith(
        status: CanvasExportStatus.error,
        message: 'Error: $e',
      );
    } finally {
      if (file != null && file.existsSync()) {
        await file.delete(recursive: true);
      }
    }
  }

  Future<Int8List?> _renderCanvasToBytes({
    required Size size,
    required double dpr,
    required int qltyValue,
    required Variation variation,
    required Template template,
  }) async {
    try {
      final recorder = ui.PictureRecorder();
      final canvas = Canvas(recorder);

      final painter = TemplatePainter(
        variation: variation,
        template: template,
        hintIndex: null,
        hintOpacity: 1.0,
        paintOverlay: true,
        isCanvasFull: true,
      );

      painter.paint(canvas, size);

      final picture = recorder.endRecording();

      // double height = size.height * dpr;
      // double width = size.width * dpr;
      // double fact = 1;
      // final sizeHorizontal = size.width;

      // if (qltyValue == 0) {
      //   fact = 720 / sizeHorizontal;
      //   height = height * fact;
      //   width = width * fact;
      // } else if (qltyValue == 1) {
      //   fact = 1080 / sizeHorizontal;
      //   height = height * fact;
      //   width = width * fact;
      // } else if (qltyValue == 2) {
      //   fact = 2160 / sizeHorizontal;
      //   height = height * fact;
      //   width = width * fact;
      // }

      final image = await picture.toImage(
        size.width.toInt(),
        size.height.toInt(),
      );
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      return byteData?.buffer.asInt8List();
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> _requestStoragePermission() async {
    if (!await Gal.hasAccess()) {
      return await Gal.requestAccess();
    }
    return true;
  }

  void clearStatus() {
    state = const CanvasExportState();
  }
}
