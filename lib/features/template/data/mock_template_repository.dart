import 'package:colartive2/features/template/data/i_template_repository.dart';
import 'package:colartive2/features/template/model/template.dart';

class MockTemplateRepository extends ITemplateRepository {
  @override
  Future<List<Template>> getAll() async {
    return [
      const Template(
        fontFamily: "Deadpool",
        fontFilePath: "assets/templates/DeadPoolMed.ttf",
        fontSize: 220,
        charCodes: [
          0xe800,
          0xe801,
          0xe802,
          0xe803,
          0xe804,
          0xe805,
          0xe806,
        ],
        maxColors: 5,
        name: "Deadpool",
        thumbnailPath: "www.firebase.com/asda/",
      ),
    ];
  }
}
