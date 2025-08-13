import 'package:colartive2/features/template/model/template.dart';

abstract class ITemplateRepository {
  Future<List<Template>> getAll();
  Future<Template> get(String id);
  Future<void> loadFont(String path, String familyName);
}
