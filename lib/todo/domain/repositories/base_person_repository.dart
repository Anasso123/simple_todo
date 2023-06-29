import 'package:dartz/dartz.dart';
import 'package:fortune_wheel/core/domain/error/failure.dart';
import 'package:fortune_wheel/core/domain/params/params.dart';
import 'package:fortune_wheel/fortune_wheel/domain/entities/person.dart';
import 'package:hive/hive.dart';

abstract class BasePersonRepository {
  Future<Either<Failure,Box<Person>>> getPerson();
  Future<Either<Failure,void>> addPerson(PersonParams params);
  Future<Either<Failure,void>> deletePerson(Person person);
  Future<Either<Failure,void>> updatePerson(PersonParams params);
}