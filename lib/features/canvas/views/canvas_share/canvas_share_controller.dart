import 'package:colartive2/features/canvas/data/i_variation_repository.dart';
import 'package:colartive2/features/canvas/data/variation_repository.dart';
import 'package:colartive2/features/canvas/model/shared_variation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final canvasShareControllerProvider =
    StateNotifierProvider.autoDispose<CanvasShareController, AsyncValue<void>>(
        (ref) {
  final authService = ref.watch(variationRepositoryProvider);
  return CanvasShareController(authService);
});

class CanvasShareController extends StateNotifier<AsyncValue<void>> {
  final IVariationRepository variationRepository;
  CanvasShareController(this.variationRepository)
      : super(const AsyncData(null));

  Future<void> share({required SharedVariation variation}) async {
    FocusManager.instance.primaryFocus?.unfocus();

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => variationRepository.add(variation),
    );
  }
}
