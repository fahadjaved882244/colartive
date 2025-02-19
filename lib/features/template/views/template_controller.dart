import 'dart:async';

import 'package:colartive2/features/template/data/i_template_repository.dart';
import 'package:colartive2/features/template/data/template_repository.dart';
import 'package:colartive2/features/template/model/template.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final templateDetailProvider =
    Provider.family<AsyncValue<Template?>, String>((ref, id) {
  final listProvider = ref.watch(templateListProvider);
  return listProvider
      .whenData((list) => list.where((t) => t.name == id).firstOrNull);
});

final templateListProvider =
    AsyncNotifierProvider<TemplateListNotifier, List<Template>>(() {
  return TemplateListNotifier();
});

class TemplateListNotifier extends AsyncNotifier<List<Template>> {
  late final ITemplateRepository _repository;

  @override
  FutureOr<List<Template>> build() {
    _repository = ref.read(templateRepositoryProvider);
    return _repository.getAll();
  }
}
