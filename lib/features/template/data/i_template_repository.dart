import 'package:colartive2/features/template/model/template.dart';

abstract class ITemplateRepository {
  Future<List<Template>> getAll();
}
