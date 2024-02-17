import 'package:faker/faker.dart';
import 'package:forestvpn_test/features/news/domain/export.dart';
import 'package:uuid/uuid.dart';

abstract class ModelFactory<T> {
  Faker get faker => Faker();

  /// Creates a fake uuid.
  String createFakeUuid() {
    return const Uuid().v4();
  }

  /// Generate a single fake model.
  T generateFake();

  /// Generate fake list based on provided length.
  List<T> generateFakeList({required int length});
}

class ArticleModel extends ModelFactory<Article> {
  @override
  Article generateFake() {
    return Article(
      id: createFakeUuid(),
      title: faker.lorem.word(),
      publicationDate: faker.date.dateTime(minYear: 2023, maxYear: 2024),
      imageUrl: faker.image.image(),
      readed: false,
      description: faker.lorem.sentences(10).toString(),
    );
  }

  @override
  List<Article> generateFakeList({required int length}) {
    return List.generate(length, (index) => generateFake());
  }
}
