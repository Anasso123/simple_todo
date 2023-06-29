import 'package:dartz/dartz.dart';
import 'package:fortune_wheel/core/domain/error/exeptions.dart';
import 'package:fortune_wheel/core/domain/error/failure.dart';
import 'package:fortune_wheel/core/domain/params/params.dart';
import 'package:fortune_wheel/fortune_wheel/data/data_sources/person_datasource.dart';
import 'package:fortune_wheel/fortune_wheel/domain/entities/person.dart';
import 'package:fortune_wheel/fortune_wheel/domain/repositories/base_person_repository.dart';
import 'package:hive/hive.dart';

class PersonRepository extends BasePersonRepository {
  final BasePersonDatasource basePersonDatasource;

  PersonRepository({required this.basePersonDatasource});

  @override
  Future<Either<Failure, Box<Person>>> getPerson() async {
    final result = await basePersonDatasource.getPerson();
    try {
      return Right(result);
    } on LocalException catch (failure) {
      return Left(LocalFailure(message: failure.errorMessage));
    }
  }

  @override
  Future<Either<Failure, void>> addPerson(PersonParams params) async {
    final result = await basePersonDatasource.addPerson(params);
    try {
      return Right(result);
    } on LocalException catch (failure) {
      return Left(LocalFailure(message: failure.errorMessage));
    }
  }

  @override
  Future<Either<Failure, void>> deletePerson(Person person) async {
    final result = await basePersonDatasource.deletePerson(person);
    try {
      return Right(result);
    } on LocalException catch (failure) {
      return Left(LocalFailure(message: failure.errorMessage));
    }
  }

  @override
  Future<Either<Failure, void>> updatePerson(PersonParams params) async {
    final result = await basePersonDatasource.updatePerson(params);
    try {
      return Right(result);
    } on LocalException catch (failure) {
      return Left(LocalFailure(message: failure.errorMessage));
    }
  }
}
