import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arch/core/error/failure.dart';
import 'package:flutter_clean_arch/features/domain/entities/user.dart';

abstract class DoLoginRepository {
  Future<Either<Failure, User>> doLogin({
    required String email,
    required String password,
  });
}
