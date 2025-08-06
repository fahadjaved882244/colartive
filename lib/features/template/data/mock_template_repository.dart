import 'package:colartive2/features/template/data/i_template_repository.dart';
import 'package:colartive2/features/template/model/template.dart';

class MockTemplateRepository extends ITemplateRepository {
  @override
  Future<List<Template>> getAll() async {
    return [
      Template(
        id: "1",
        fontFamily: "BabyYoda",
        fontFileUrl: "assets/templates/BabyYoda.ttf",
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
        thumbnailUrl: "www.firebase.com/asda/",
        createdAt: DateTime(1, 1, 2023),
        isActive: true,
      ),
      Template(
        id: "3",
        fontFamily: "Camelion",
        fontFileUrl: "assets/templates/Camlion.ttf",
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
        thumbnailUrl: "www.firebase.com/asda/",
        createdAt: DateTime(1, 1, 2023),
        isActive: true,
      ),
      Template(
        id: "2",
        fontFamily: "Deadpool",
        fontFileUrl: "assets/templates/DeadPoolMed.ttf",
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
        thumbnailUrl: "www.firebase.com/asda/",
        createdAt: DateTime(1, 1, 2023),
        isActive: true,
      ),
    ];
  }

  @override
  Future<Template> get(String id) {
    throw UnimplementedError();
  }

  @override
  Future<void> loadFont(String path, String familyName) {
    throw UnimplementedError();
  }
}
