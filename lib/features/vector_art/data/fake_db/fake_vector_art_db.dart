import '../../../../utils/repositories/fack_model_factory.dart';
import '../../model/base_models/vector_scaffold.dart';
import '../../model/base_models/vector_skin.dart';
import '../../model/vector_art_wrapper.dart';

const randColorPallets = [
  [
    0xFF001100,
    0xFFDE89B9,
    0xFfe63249,
    0xFFef5472,
    0xFFc8353b,
    0xFFd14e39,
    0xFfe12e72,
    0xFFee559e,
    0xFf47C0BB,
    0xFF76a34c,
    0xFf93c54a,
    0xFFfcce29,
    0xFF7bccc9,
    0xFFFAC444,
    0xFfF79834,
    0xFF34B7D1,
    0xFF25B0A7,
    0xFF367ABD,
    0xFFCCDD5A,
    0xFf6F5EA7,
    0xFFFAF5A5,
    0xFFEE86B6,
    0xFfFCF2A8,
    0xFFFCE43C,
    0xFF6257A3,
  ],
  [
    0xFF011232,
    0xFFFAC444,
    0xFfF79834,
    0xFF34B7D1,
    0xFF25B0A7,
    0xFF367ABD,
    0xFFCCDD5A,
    0xFf6F5EA7,
    0xFFFAF5A5,
    0xFFEE86B6,
    0xFfFCF2A8,
    0xFFFCE43C,
    0xFF6257A3,
  ],
  [
    0xFF001122,
    0xFFee559e,
    0xFf47C0BB,
    0xFF76a34c,
    0xFf93c54a,
    0xFFfcce29,
    0xFF7bccc9,
    0xFFFAC444,
    0xFfF79834,
    0xFF34B7D1,
    0xFF25B0A7,
    0xFF367ABD,
  ],
];

const fonts = [
  {
    "path": "assets/vectors/wolf.ttf",
    "name": "wolf",
  },
  {
    "path": "assets/vectors/lio.ttf",
    "name": "lio",
  },
  {
    "path": "assets/vectors/gori.ttf",
    "name": "gori",
  },
  {
    "path": "assets/vectors/sum.ttf",
    "name": "sum",
  },
  {
    "path": "assets/vectors/bk.ttf",
    "name": "bk",
  },
];

class FakeVectorArtWrapperFactory extends FakeModelFactory<VectorArtWrapper> {
  @override
  VectorArtWrapper generateFake() {
    return VectorArtWrapper(
      id: createFakeUuid(),
      scaffoldId: createFakeUuid(),
      skinId: null,
    );
  }

  @override
  List<VectorArtWrapper> generateFakeList({required int length}) {
    return List.generate(length, (index) => generateFake());
  }
}

class FakeVectorScaffoldFactory extends FakeModelFactory<VectorScaffold> {
  @override
  VectorScaffold generateFake() {
    final font = faker.randomGenerator.element(fonts);
    return VectorScaffold(
      id: createFakeUuid(),
      designerId: createFakeUuid(),
      category: faker.lorem.word(),
      tags: faker.lorem.words(5),
      dateAdded: faker.date.dateTime(),
      fontFilePath: font["path"]!,
      fontFamilyName: font["name"]!,
      name: faker.animal.name(),
      type: faker.randomGenerator.element(VectorType.values),
      elements: [
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
        0xe80d,
        0xe80e,
        0xe80f,
        0xe810,
        0xe811,
        0xe812,
        0xe813,
        0xe814,
        0xe815,
      ],
    );
  }

  @override
  List<VectorScaffold> generateFakeList({required int length}) {
    return List.generate(length, (index) => generateFake());
  }
}

class FakeVectorSkinFactory extends FakeModelFactory<VectorSkin> {
  @override
  VectorSkin generateFake() {
    return VectorSkin(
      id: createFakeUuid(),
      contributorId: createFakeUuid(),
      colorPalette: faker.randomGenerator.element(randColorPallets),
    );
  }

  @override
  List<VectorSkin> generateFakeList({required int length}) {
    return List.generate(length, (index) => generateFake());
  }
}
