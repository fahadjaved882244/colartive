import 'package:colartive2/features/template/data/i_template_repository.dart';
import 'package:colartive2/features/template/model/template.dart';

class MockTemplateRepository extends ITemplateRepository {
  @override
  Future<List<Template>> getAll() async {
    return [
      Template(
        fontFamily: "BabyYoda",
        fontFileUrl: "assets/templates/BabyYoda.ttf",
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
        isPremium: false,
        isLargerSize: false,
        sizeRatio: 0.85,
        useHeightSize: false,
      ),
      Template(
        fontFamily: "Camelion",
        fontFileUrl: "assets/templates/Camlion.ttf",
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
        isPremium: false,
        isLargerSize: false,
        sizeRatio: 0.85,
        useHeightSize: false,
      ),
      Template(
        fontFamily: "Deadpool",
        fontFileUrl: "assets/templates/DeadPoolMed.ttf",
        charCodes: [
          0xe800,
          0xe801,
          0xe802,
          0xe803,
          0xe804,
          0xe805,
        ],
        maxColors: 6,
        isLargerSize: false,
        name: "Deadpool",
        thumbnailUrl: "www.firebase.com/asda/",
        createdAt: DateTime(1, 1, 2023),
        isActive: true,
        isPremium: false,
        sizeRatio: 0.85,
        useHeightSize: false,
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
