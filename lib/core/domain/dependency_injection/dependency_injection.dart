import 'package:fortune_wheel/fortune_wheel/data/data_sources/person_datasource.dart';
import 'package:fortune_wheel/fortune_wheel/data/repositories/person_repository.dart';
import 'package:fortune_wheel/fortune_wheel/domain/repositories/base_person_repository.dart';
import 'package:fortune_wheel/fortune_wheel/domain/use_cases/add_person.dart';
import 'package:fortune_wheel/fortune_wheel/domain/use_cases/delete_person.dart';
import 'package:fortune_wheel/fortune_wheel/domain/use_cases/get_person.dart';
import 'package:fortune_wheel/fortune_wheel/domain/use_cases/update_person.dart';
import 'package:fortune_wheel/fortune_wheel/presentation/manager/person_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class DependencyInjection {
  void init() {
    // Bloc
    sl.registerFactory(() => PersonBloc(sl(), sl(), sl(),sl()));

    // Use cases
    sl.registerLazySingleton(() => GetPersonUseCase(sl()));
    sl.registerLazySingleton(() => AddPersonUseCase(sl()));
    sl.registerLazySingleton(() => DeletePersonUseCase(sl()));
    sl.registerLazySingleton(() => UpdatePersonUseCase(sl()));

    // Repository
    sl.registerLazySingleton<BasePersonRepository>(
        () => PersonRepository(basePersonDatasource: sl()));

    // Datasource
    sl.registerLazySingleton<BasePersonDatasource>(() => PersonDatasource());
  }
}
