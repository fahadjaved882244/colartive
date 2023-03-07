import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class IFormStateController extends AutoDisposeNotifier<IFormState> {
  final formKey = GlobalKey<FormState>();
  @override
  IFormState build() {
    ref.onDispose(() => onDispose());
    return IFormState.initial();
  }

  void updateValidation() {
    state = state.copyWith(validateMode: AutovalidateMode.onUserInteraction);
  }

  onDispose();
}

class IFormState {
  final AsyncValue<void> asyncValue;
  final AutovalidateMode validateMode;
  IFormState({
    required this.asyncValue,
    required this.validateMode,
  });

  factory IFormState.initial() {
    return IFormState(
      asyncValue: const AsyncData(null),
      validateMode: AutovalidateMode.disabled,
    );
  }

  IFormState copyWith({
    AsyncValue<void>? asyncValue,
    AutovalidateMode? validateMode,
  }) {
    return IFormState(
      asyncValue: asyncValue ?? this.asyncValue,
      validateMode: validateMode ?? this.validateMode,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is IFormState &&
        other.asyncValue == asyncValue &&
        other.validateMode == validateMode;
  }

  @override
  int get hashCode => asyncValue.hashCode ^ validateMode.hashCode;

  @override
  String toString() =>
      'IFormState(asyncState: $asyncValue, validateMode: $validateMode)';
}
