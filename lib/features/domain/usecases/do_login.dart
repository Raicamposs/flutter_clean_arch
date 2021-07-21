import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arch/core/error/failure.dart';
import 'package:flutter_clean_arch/core/usecase/usecase.dart';
import 'package:flutter_clean_arch/features/domain/entities/user.dart';
import 'package:flutter_clean_arch/features/domain/repositories/do_login_repository.dart';

class DoLoginParams {
  final String password;
  final String email;

  DoLoginParams({
    required this.password,
    required this.email,
  });
}

class DoLogin extends UseCase<User, DoLoginParams> {
  final DoLoginRepository _repository;

  DoLogin(this._repository);

  @override
  Future<Either<Failure, User>> call(DoLoginParams params) {
    return _repository.doLogin(
      password: params.password,
      email: params.email,
    );
  }
}
