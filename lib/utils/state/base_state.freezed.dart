// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BaseState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) data,
    required TResult Function(AppError error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? data,
    TResult? Function(AppError error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? data,
    TResult Function(AppError error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_BaseStateInitial<T> value) initial,
    required TResult Function(_BaseStateLoading<T> value) loading,
    required TResult Function(_BaseStateData<T> value) data,
    required TResult Function(_BaseStateError<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_BaseStateInitial<T> value)? initial,
    TResult? Function(_BaseStateLoading<T> value)? loading,
    TResult? Function(_BaseStateData<T> value)? data,
    TResult? Function(_BaseStateError<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BaseStateInitial<T> value)? initial,
    TResult Function(_BaseStateLoading<T> value)? loading,
    TResult Function(_BaseStateData<T> value)? data,
    TResult Function(_BaseStateError<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseStateCopyWith<T, $Res> {
  factory $BaseStateCopyWith(
          BaseState<T> value, $Res Function(BaseState<T>) then) =
      _$BaseStateCopyWithImpl<T, $Res, BaseState<T>>;
}

/// @nodoc
class _$BaseStateCopyWithImpl<T, $Res, $Val extends BaseState<T>>
    implements $BaseStateCopyWith<T, $Res> {
  _$BaseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_BaseStateInitialCopyWith<T, $Res> {
  factory _$$_BaseStateInitialCopyWith(_$_BaseStateInitial<T> value,
          $Res Function(_$_BaseStateInitial<T>) then) =
      __$$_BaseStateInitialCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$_BaseStateInitialCopyWithImpl<T, $Res>
    extends _$BaseStateCopyWithImpl<T, $Res, _$_BaseStateInitial<T>>
    implements _$$_BaseStateInitialCopyWith<T, $Res> {
  __$$_BaseStateInitialCopyWithImpl(_$_BaseStateInitial<T> _value,
      $Res Function(_$_BaseStateInitial<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_BaseStateInitial<T> implements _BaseStateInitial<T> {
  const _$_BaseStateInitial();

  @override
  String toString() {
    return 'BaseState<$T>.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_BaseStateInitial<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) data,
    required TResult Function(AppError error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? data,
    TResult? Function(AppError error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? data,
    TResult Function(AppError error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_BaseStateInitial<T> value) initial,
    required TResult Function(_BaseStateLoading<T> value) loading,
    required TResult Function(_BaseStateData<T> value) data,
    required TResult Function(_BaseStateError<T> value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_BaseStateInitial<T> value)? initial,
    TResult? Function(_BaseStateLoading<T> value)? loading,
    TResult? Function(_BaseStateData<T> value)? data,
    TResult? Function(_BaseStateError<T> value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BaseStateInitial<T> value)? initial,
    TResult Function(_BaseStateLoading<T> value)? loading,
    TResult Function(_BaseStateData<T> value)? data,
    TResult Function(_BaseStateError<T> value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _BaseStateInitial<T> implements BaseState<T> {
  const factory _BaseStateInitial() = _$_BaseStateInitial<T>;
}

/// @nodoc
abstract class _$$_BaseStateLoadingCopyWith<T, $Res> {
  factory _$$_BaseStateLoadingCopyWith(_$_BaseStateLoading<T> value,
          $Res Function(_$_BaseStateLoading<T>) then) =
      __$$_BaseStateLoadingCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$_BaseStateLoadingCopyWithImpl<T, $Res>
    extends _$BaseStateCopyWithImpl<T, $Res, _$_BaseStateLoading<T>>
    implements _$$_BaseStateLoadingCopyWith<T, $Res> {
  __$$_BaseStateLoadingCopyWithImpl(_$_BaseStateLoading<T> _value,
      $Res Function(_$_BaseStateLoading<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_BaseStateLoading<T> implements _BaseStateLoading<T> {
  const _$_BaseStateLoading();

  @override
  String toString() {
    return 'BaseState<$T>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_BaseStateLoading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) data,
    required TResult Function(AppError error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? data,
    TResult? Function(AppError error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? data,
    TResult Function(AppError error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_BaseStateInitial<T> value) initial,
    required TResult Function(_BaseStateLoading<T> value) loading,
    required TResult Function(_BaseStateData<T> value) data,
    required TResult Function(_BaseStateError<T> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_BaseStateInitial<T> value)? initial,
    TResult? Function(_BaseStateLoading<T> value)? loading,
    TResult? Function(_BaseStateData<T> value)? data,
    TResult? Function(_BaseStateError<T> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BaseStateInitial<T> value)? initial,
    TResult Function(_BaseStateLoading<T> value)? loading,
    TResult Function(_BaseStateData<T> value)? data,
    TResult Function(_BaseStateError<T> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _BaseStateLoading<T> implements BaseState<T> {
  const factory _BaseStateLoading() = _$_BaseStateLoading<T>;
}

/// @nodoc
abstract class _$$_BaseStateDataCopyWith<T, $Res> {
  factory _$$_BaseStateDataCopyWith(
          _$_BaseStateData<T> value, $Res Function(_$_BaseStateData<T>) then) =
      __$$_BaseStateDataCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$_BaseStateDataCopyWithImpl<T, $Res>
    extends _$BaseStateCopyWithImpl<T, $Res, _$_BaseStateData<T>>
    implements _$$_BaseStateDataCopyWith<T, $Res> {
  __$$_BaseStateDataCopyWithImpl(
      _$_BaseStateData<T> _value, $Res Function(_$_BaseStateData<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$_BaseStateData<T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$_BaseStateData<T> implements _BaseStateData<T> {
  const _$_BaseStateData({required this.data});

  @override
  final T data;

  @override
  String toString() {
    return 'BaseState<$T>.data(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BaseStateData<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BaseStateDataCopyWith<T, _$_BaseStateData<T>> get copyWith =>
      __$$_BaseStateDataCopyWithImpl<T, _$_BaseStateData<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) data,
    required TResult Function(AppError error) error,
  }) {
    return data(this.data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? data,
    TResult? Function(AppError error)? error,
  }) {
    return data?.call(this.data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? data,
    TResult Function(AppError error)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this.data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_BaseStateInitial<T> value) initial,
    required TResult Function(_BaseStateLoading<T> value) loading,
    required TResult Function(_BaseStateData<T> value) data,
    required TResult Function(_BaseStateError<T> value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_BaseStateInitial<T> value)? initial,
    TResult? Function(_BaseStateLoading<T> value)? loading,
    TResult? Function(_BaseStateData<T> value)? data,
    TResult? Function(_BaseStateError<T> value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BaseStateInitial<T> value)? initial,
    TResult Function(_BaseStateLoading<T> value)? loading,
    TResult Function(_BaseStateData<T> value)? data,
    TResult Function(_BaseStateError<T> value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class _BaseStateData<T> implements BaseState<T> {
  const factory _BaseStateData({required final T data}) = _$_BaseStateData<T>;

  T get data;
  @JsonKey(ignore: true)
  _$$_BaseStateDataCopyWith<T, _$_BaseStateData<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_BaseStateErrorCopyWith<T, $Res> {
  factory _$$_BaseStateErrorCopyWith(_$_BaseStateError<T> value,
          $Res Function(_$_BaseStateError<T>) then) =
      __$$_BaseStateErrorCopyWithImpl<T, $Res>;
  @useResult
  $Res call({AppError error});

  $AppErrorCopyWith<$Res> get error;
}

/// @nodoc
class __$$_BaseStateErrorCopyWithImpl<T, $Res>
    extends _$BaseStateCopyWithImpl<T, $Res, _$_BaseStateError<T>>
    implements _$$_BaseStateErrorCopyWith<T, $Res> {
  __$$_BaseStateErrorCopyWithImpl(
      _$_BaseStateError<T> _value, $Res Function(_$_BaseStateError<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_BaseStateError<T>(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppError,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $AppErrorCopyWith<$Res> get error {
    return $AppErrorCopyWith<$Res>(_value.error, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

/// @nodoc

class _$_BaseStateError<T> implements _BaseStateError<T> {
  const _$_BaseStateError({required this.error});

  @override
  final AppError error;

  @override
  String toString() {
    return 'BaseState<$T>.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BaseStateError<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BaseStateErrorCopyWith<T, _$_BaseStateError<T>> get copyWith =>
      __$$_BaseStateErrorCopyWithImpl<T, _$_BaseStateError<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) data,
    required TResult Function(AppError error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? data,
    TResult? Function(AppError error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? data,
    TResult Function(AppError error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_BaseStateInitial<T> value) initial,
    required TResult Function(_BaseStateLoading<T> value) loading,
    required TResult Function(_BaseStateData<T> value) data,
    required TResult Function(_BaseStateError<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_BaseStateInitial<T> value)? initial,
    TResult? Function(_BaseStateLoading<T> value)? loading,
    TResult? Function(_BaseStateData<T> value)? data,
    TResult? Function(_BaseStateError<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BaseStateInitial<T> value)? initial,
    TResult Function(_BaseStateLoading<T> value)? loading,
    TResult Function(_BaseStateData<T> value)? data,
    TResult Function(_BaseStateError<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _BaseStateError<T> implements BaseState<T> {
  const factory _BaseStateError({required final AppError error}) =
      _$_BaseStateError<T>;

  AppError get error;
  @JsonKey(ignore: true)
  _$$_BaseStateErrorCopyWith<T, _$_BaseStateError<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
