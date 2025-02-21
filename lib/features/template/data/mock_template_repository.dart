import 'package:colartive2/features/template/data/i_template_repository.dart';
import 'package:colartive2/features/template/model/template.dart';

class MockTemplateRepository extends ITemplateRepository {
  @override
  Future<List<Template>> getAll() async {
    return [
      const Template(
        fontFamily: "BabyYoda",
        fontFilePath: "assets/templates/BabyYoda.ttf",
        fontSize: 220,
        charCodes: [
          0xe800,
          0xe801,
          0xe802,
          0xe803,
          0xe804,
          0xe805,
          0xe806,
          0xe807,
          0xe808,
          0xe80a,
          0xe80b,
          0xe809,
          0xe80c,
        ],
        maxColors: 11,
        name: "BabyYoda",
        thumbnailPath: "www.firebase.com/asda/",
      ),
      const Template(
        fontFamily: "Camelion",
        fontFilePath: "assets/templates/Camlion.ttf",
        fontSize: 220,
        charCodes: [
          0xe800,
          0xe801,
          0xe802,
          0xe803,
          0xe804,
          0xe805,
          0xe806,
          0xe807,
          0xe808,
        ],
        maxColors: 10,
        name: "Camelion",
        thumbnailPath: "www.firebase.com/asda/",
      ),
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
