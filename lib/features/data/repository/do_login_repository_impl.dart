import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arch/features/data/datasources/index.dart';

import '../../../core/error/index.dart';
import '../../../features/domain/entities/index.dart';
import '../../../features/domain/repositories/index.dart';

class DoLoginRepositoryImpl extends DoLoginRepository {
  final DoLoginDataSource dataSource;

  DoLoginRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, User>> doLogin(
      {required String email, required String password}) async {
    try {
      final user = await dataSource.doLogin(email: email, password: password);
      return Right(user);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
