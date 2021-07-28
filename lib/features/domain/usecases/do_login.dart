import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arch/core/error/failure.dart';

import '../../../core/usecase/index.dart';
import '../../../features/domain/entities/index.dart';
import '../../../features/domain/repositories/index.dart';

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
