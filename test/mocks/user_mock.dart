import 'package:faker/faker.dart';
import 'package:flutter_clean_arch/features/domain/entities/user.dart';

abstract class UserMock {
  static User make() {
    final faker = Faker();
    return User(
      name: faker.person.name(),
      pictureUrl: faker.image.image(keywords: ['people', 'avatar']),
      email: faker.internet.email(),
      bornDate: faker.date.dateTime(),
    );
  }
}
