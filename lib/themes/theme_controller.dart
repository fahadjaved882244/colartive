import 'package:colartive2/utils/repositories/storage_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final themeControllerProvider =
    StateNotifierProvider<ThemeController, ThemeState>((ref) {
  final storage = ref.read(localStorageRepositoryProvider);
  return ThemeController(storage);
});

class ThemeController extends StateNotifier<ThemeState> {
  final LocalStorageRepository _storage;
  ThemeController(this._storage) : super(ThemeState.initial()) {
    // initialising initial state of the flags
    state = state.copyWith(
      isDarkMode: _storage.darkModeFlag,
      isForceMode: _storage.forceModeFlag,
    );
  }

  /// Get info from local storage and return ThemeMode
  ThemeMode get themeMode => state.isForceMode
      ? ThemeMode.system
      : state.isDarkMode
          ? ThemeMode.dark
          : ThemeMode.light;

  Brightness get brightness {
    switch (themeMode) {
      case ThemeMode.system:
        return SchedulerBinding.instance.platformDispatcher.platformBrightness;
      case ThemeMode.dark:
        return Brightness.dark;
      case ThemeMode.light:
        return Brightness.light;
    }
  }

  void setDarkModeFlag(bool flag) {
    state = state.copyWith(isDarkMode: flag);
    _storage.saveDarkModeFlag(flag);
  }

  void setForceModeFlag(bool flag) {
    state = state.copyWith(isForceMode: flag);
    _storage.saveForceModeFlag(flag);
  }
}

class ThemeState {
  final bool isDarkMode;
  final bool isForceMode;
  const ThemeState({
    required this.isDarkMode,
    required this.isForceMode,
  });

  factory ThemeState.initial() {
    return const ThemeState(
      isDarkMode: false,
      isForceMode: false,
    );
  }

  ThemeState copyWith({
    bool? isDarkMode,
    bool? isForceMode,
  }) {
    return ThemeState(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      isForceMode: isForceMode ?? this.isForceMode,
    );
  }

  @override
  String toString() =>
      'ThemeState(isDarkMode: $isDarkMode, isForceMode: $isForceMode)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ThemeState &&
        other.isDarkMode == isDarkMode &&
        other.isForceMode == isForceMode;
  }

  @override
  int get hashCode => isDarkMode.hashCode ^ isForceMode.hashCode;
}
