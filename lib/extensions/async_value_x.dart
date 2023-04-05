import 'package:colartive2/core_packages.dart';

extension AsyncValueX<T> on AsyncValue<T> {
  Widget defaultWhen({required Widget Function(T) data}) {
    return when(
      data: data,
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text(error.toString())),
    );
  }

  Widget defaultWhenSliver({required Widget Function(T) data}) {
    return when(
      data: data,
      loading: () => const SliverFillRemaining(
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (error, _) => SliverFillRemaining(
        child: Center(child: Text(error.toString())),
      ),
    );
  }
}
