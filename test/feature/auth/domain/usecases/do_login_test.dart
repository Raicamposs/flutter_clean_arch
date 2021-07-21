import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_clean_arch/core/error/failure.dart';
import 'package:flutter_clean_arch/features/domain/repositories/do_login_repository.dart';
import 'package:flutter_clean_arch/features/domain/usecases/do_login.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../mocks/user_mock.dart';
import 'do_login_test.mocks.dart';

@GenerateMocks([DoLoginRepository])
void main() {
  late MockDoLoginRepository _repository;
  late DoLogin _doLogin;

  final user = UserMock.make();
  final email = Faker().internet.email();
  final password = Faker().internet.password();

  setUp(() {
    _repository = MockDoLoginRepository();
    _doLogin = DoLogin(_repository);
  });
  test('Deve realiizar login', () async {
    when(_repository.doLogin(
      email: anyNamed('email'),
      password: anyNamed('password'),
    )).thenAnswer((_) async => Right(user));

    var result = await _doLogin(DoLoginParams(
      password: password,
      email: email,
    ));

    expect(result, isA<Right>());
    expect(result, Right(user));

    verify(_repository.doLogin(email: email, password: password)).called(1);
    verifyNoMoreInteractions(_repository);
  });

  test('Deve falhar ao logar', () async {
    when(_repository.doLogin(
      email: anyNamed('email'),
      password: anyNamed('password'),
    )).thenAnswer((_) async => Left(InvalidCredentialsFailure()));

    var result = await _doLogin(DoLoginParams(
      password: password,
      email: email,
    ));

    expect(result, isA<Left>());
    expect(result, Left(InvalidCredentialsFailure()));

    verify(_repository.doLogin(email: email, password: password)).called(1);
    verifyNoMoreInteractions(_repository);
  });
}
