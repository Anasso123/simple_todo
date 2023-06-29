import 'package:dartz/dartz.dart';
import 'package:fortune_wheel/core/domain/error/failure.dart';
import 'package:fortune_wheel/core/domain/params/params.dart';
import 'package:fortune_wheel/core/domain/usecase/usecases.dart';
import 'package:fortune_wheel/fortune_wheel/domain/entities/person.dart';
import 'package:fortune_wheel/fortune_wheel/domain/repositories/base_person_repository.dart';
import 'package:hive/hive.dart';

class GetPersonUseCase extends BaseUseCase<Box<Person>,NoParams>{
  final BasePersonRepository repository;

  GetPersonUseCase(this.repository);
  @override
  Future<Either<Failure, Box<Person>>> call(NoParams parameters) async{
    return await repository.getPerson();
  }

}