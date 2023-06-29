part of 'person_bloc.dart';

class PersonState extends Equatable {
  final List<Person> persons;
  final String errorMessage;
  final RequestState personState;

  const PersonState({
    this.persons = const [],
    this.errorMessage = '',
    this.personState = RequestState.loading,
  });

  PersonState copyWith({
    List<Person>? persons,
    String? errorMessage,
    RequestState? personState,
  }) {
    return PersonState(
      errorMessage: errorMessage ?? this.errorMessage,
      persons: persons ?? this.persons,
      personState: personState ?? this.personState,
    );
  }

  @override
  List<Object?> get props => [
        persons,
        errorMessage,
        personState,
      ];
}
