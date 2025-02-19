import 'package:colartive2/features/template/data/i_template_repository.dart';
import 'package:colartive2/features/template/data/mock_template_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final templateRepositoryProvider = Provider<ITemplateRepository>((ref) {
  return MockTemplateRepository();
});
