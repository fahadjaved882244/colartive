import 'package:colartive2/features/template/data/template_repository.dart';
import 'package:colartive2/features/template/model/template.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final templateListProvider = FutureProvider<List<Template>>(
  (ref) async {
    final repository = ref.watch(templateRepositoryProvider);
    return repository.getAll();
  },
);

final fontListProvider = StateProvider<List<String>>((ref) => []);

final templateDetailProvider =
    FutureProvider.autoDispose.family<Template, String>(
  (ref, id) async {
    final repository = ref.watch(templateRepositoryProvider);
    final template = await repository.get(id);
    if (!ref.read(fontListProvider).contains(template.fontFamily)) {
      await repository.loadFont(template.fontFileUrl, template.fontFamily);
      ref.read(fontListProvider.notifier).state = [
        ...ref.read(fontListProvider),
        template.fontFamily,
      ];
    }
    return template;
  },
);
