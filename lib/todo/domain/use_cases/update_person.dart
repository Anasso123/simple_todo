import 'package:dartz/dartz.dart';
import 'package:fortune_wheel/core/domain/error/failure.dart';
import 'package:fortune_wheel/core/domain/params/params.dart';
import 'package:fortune_wheel/core/domain/usecase/usecases.dart';
import 'package:fortune_wheel/fortune_wheel/domain/repositories/base_person_repository.dart';

class UpdatePersonUseCase extends BaseUseCase<void,PersonParams>{
  final BasePersonRepository repository;

  UpdatePersonUseCase(this.repository);
  @override
  Future<Either<Failure, void>> call(PersonParams parameters) async{
    return await repository.updatePerson(parameters);
  }

}