import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arch/core/error/index.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
