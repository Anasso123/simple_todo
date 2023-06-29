import 'package:dartz/dartz.dart';
import 'package:fortune_wheel/core/domain/error/failure.dart';

abstract class BaseUseCase<T, Parameters> {
  Future<Either<Failure, T>> call(Parameters parameters);
}