import 'package:dartz/dartz.dart';
import 'package:fortune_wheel/core/domain/error/failure.dart';
import 'package:fortune_wheel/core/domain/usecase/usecases.dart';
import 'package:fortune_wheel/fortune_wheel/domain/entities/person.dart';
import 'package:fortune_wheel/fortune_wheel/domain/repositories/base_person_repository.dart';
import 'package:hive/hive.dart';

class DeletePersonUseCase extends BaseUseCase<void,Person>{
  final BasePersonRepository repository;

  DeletePersonUseCase(this.repository);
  @override
  Future<Either<Failure, void>> call(Person parameters) async{
    return await repository.deletePerson(parameters);
  }

}