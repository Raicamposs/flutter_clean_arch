import 'package:dartz/dartz.dart';

import '../../../core/error/index.dart';
import '../../../features/domain/entities/index.dart';

abstract class DoLoginRepository {
  Future<Either<Failure, User>> doLogin({
    required String email,
    required String password,
  });
}
