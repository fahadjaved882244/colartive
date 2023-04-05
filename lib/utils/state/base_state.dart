import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../error/app_error.dart';

part 'base_state.freezed.dart';

@freezed
class BaseState<T> with _$BaseState<T> {
  const factory BaseState.initial() = _BaseStateInitial<T>;

  ///Loading
  const factory BaseState.loading() = _BaseStateLoading<T>;

  ///Data
  const factory BaseState.data({required T data}) = _BaseStateData<T>;

  ///Error
  const factory BaseState.error({required AppError error}) = _BaseStateError<T>;

  static Future<BaseState<T>> guard<T>(
    TaskEither<AppError, T> taskEither,
  ) async {
    final task = taskEither.match(
        (l) => BaseState<T>.error(error: l), (r) => BaseState.data(data: r));
    return await task.run();
  }
}
