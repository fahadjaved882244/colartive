import 'package:colartive2/utils/error/app_error.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final deviceStoragerRepoProvider = Provider<DeviceStorageRepository>((ref) {
  return DeviceStorageRepository();
});

class DeviceStorageRepository {
  TaskEither<AppError, Uint8List> pickImage() {
    return TaskEither.tryCatch(
      () => FilePicker.platform.pickFiles(
        type: FileType.image,
        lockParentWindow: true,
      ),
      (_, __) => const AppError.filePick(),
    )
        .flatMap(
          (r) => TaskEither.fromNullable(
            r,
            () => const AppError.cancelledByUser(),
          ),
        )
        .flatMap(
          (r) => TaskEither.fromNullable(
            r.files.first.bytes,
            () => const AppError.filePick(),
          ),
        );
  }
}
