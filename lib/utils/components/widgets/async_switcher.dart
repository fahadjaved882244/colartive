import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AsyncValueBuilder<T> extends StatelessWidget {
  final AsyncValue<T?> asyncValue;
  final Widget Function(T) builder;
  const AsyncValueBuilder({
    super.key,
    required this.asyncValue,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return switch (asyncValue) {
      AsyncData(:final value) => value != null
          ? builder(value)
          : const Scaffold(
              body: Center(child: Text('Unexpected null value')),
            ),
      AsyncError(:final error) => Scaffold(
          body: Center(child: Text('Error: $error')),
        ),
      _ => Center(child: CircularProgressIndicator()),
    };
  }
}
