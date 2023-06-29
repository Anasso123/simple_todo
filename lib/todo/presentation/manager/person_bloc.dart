import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fortune_wheel/core/domain/enums/enums.dart';
import 'package:fortune_wheel/core/domain/params/params.dart';
import 'package:fortune_wheel/fortune_wheel/domain/entities/person.dart';
import 'package:fortune_wheel/fortune_wheel/domain/use_cases/add_person.dart';
import 'package:fortune_wheel/fortune_wheel/domain/use_cases/delete_person.dart';
import 'package:fortune_wheel/fortune_wheel/domain/use_cases/get_person.dart';
import 'package:fortune_wheel/fortune_wheel/domain/use_cases/update_person.dart';

part 'person_event.dart';

part 'person_state.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  final GetPersonUseCase getPersonUseCase;
  final AddPersonUseCase addPersonUseCase;
  final DeletePersonUseCase deletePersonUseCase;
  final UpdatePersonUseCase updatePersonUseCase;

  PersonBloc(
    this.getPersonUseCase,
    this.addPersonUseCase,
    this.deletePersonUseCase,
    this.updatePersonUseCase,
  ) : super(const PersonState()) {
    on<GetAllPersonsEvents>(_onGetAllPerson);
    on<AddPersonsEvents>(_onAddPersons);
    on<DeletePersonEvents>(_onDeletePerson);
    on<UpdatePersonEvents>(_onUpdatePerson);
  }

  FutureOr<void> _onGetAllPerson(
      GetAllPersonsEvents event, Emitter<PersonState> emit) async {
    final result = await getPersonUseCase(NoParams());
    result.fold(
        (l) => emit(state.copyWith(
              errorMessage: l.message,
              personState: RequestState.error,
            )),
        (r) => emit(state.copyWith(
              personState: RequestState.loaded,
              persons: r.values.toList(),
            )));
  }

  FutureOr<void> _onAddPersons(
      AddPersonsEvents event, Emitter<PersonState> emit) async {
    final result = await addPersonUseCase(PersonParams(
      fullName: event.fullName,
      email: event.email,
      phone: event.phone,
      info: event.info,
    ));
    result.fold(
        (l) => emit(state.copyWith(
              personState: RequestState.error,
            )),
        (r) => emit(state.copyWith(
              personState: RequestState.loaded,
            )));
  }

  FutureOr<void> _onDeletePerson(
      DeletePersonEvents event, Emitter<PersonState> emit) async {
    final result = await deletePersonUseCase(event.person);
    result.fold(
        (l) => emit(state.copyWith(
              personState: RequestState.error,
            )),
        (r) => emit(state.copyWith(
              personState: RequestState.loaded,
            )));
  }

  FutureOr<void> _onUpdatePerson(
      UpdatePersonEvents event, Emitter<PersonState> emit) async {
    final result = await updatePersonUseCase(PersonParams(
      fullName: event.fullName,
      email: event.email,
      phone: event.phone,
      info: event.info,
      person: event.person,
    ));
    result.fold(
        (l) => emit(state.copyWith(
              personState: RequestState.error,
            )),
        (r) => emit(state.copyWith(
              personState: RequestState.loaded,
            )));
  }
}
