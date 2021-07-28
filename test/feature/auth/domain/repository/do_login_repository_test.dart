import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_clean_arch/core/error/failure.dart';
import 'package:flutter_clean_arch/features/data/datasources/index.dart';
import 'package:flutter_clean_arch/features/data/repository/index.dart';
import 'package:flutter_clean_arch/features/domain/repositories/do_login_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/index.dart';
import 'do_login_repository_test.mocks.dart';

@GenerateMocks([DoLoginDataSource])
void main() {
  late MockDoLoginDataSource _datasource;
  late DoLoginRepository _repository;
  final user = UserMock.makeModel();
  final faker = Faker();

  setUp(() {
    _datasource = MockDoLoginDataSource();
    _repository = DoLoginRepositoryImpl(_datasource);
  });

  test('Deve realiizar login', () async {
    when(_datasource.doLogin(
      email: anyNamed('email'),
      password: anyNamed('password'),
    )).thenAnswer((_) async => user);

    final email = faker.internet.email();
    final password = faker.internet.password();

    final result = await _repository.doLogin(email: email, password: password);

    expect(result, isA<Right>());
    expect(result, Right(user));

    verify(_datasource.doLogin(email: email, password: password)).called(1);
    verifyNoMoreInteractions(_datasource);
  });
  test('Deve obter erro ao realizar login', () async {
    when(_datasource.doLogin(
      email: anyNamed('email'),
      password: anyNamed('password'),
    )).thenThrow(InvalidCredentialsFailure());

    final email = faker.internet.email();
    final password = faker.internet.password();

    final result = await _repository.doLogin(email: email, password: password);
    expect(result, isA<Left>());
    expect(result, Left(InvalidCredentialsFailure()));

    verify(_datasource.doLogin(email: email, password: password)).called(1);
    verifyNoMoreInteractions(_datasource);
  });
  // test('Deve obter erro ao realizar login', () async {
  //   when(_datasource.doLogin(
  //     email: anyNamed('email'),
  //     password: anyNamed('password'),
  //   )).thenThrow(InvalidCredentialsFailure());

  //   final email = faker.internet.email();
  //   final password = faker.internet.password();

  //   expect(() => _repository.doLogin(email: email, password: password),throwsA(InvalidCredentialsFailure()));

  //   verify(_datasource.doLogin(email: email, password: password)).called(1);
  //   verifyNoMoreInteractions(_datasource);
  // });
}
