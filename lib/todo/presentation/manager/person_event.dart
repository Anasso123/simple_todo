part of 'person_bloc.dart';

abstract class PersonEvent extends Equatable {
  const PersonEvent();
}

class GetAllPersonsEvents extends PersonEvent {
  @override
  List<Object?> get props => [];
}

class AddPersonsEvents extends PersonEvent {
  final String fullName;
  final String info;
  final int phone;
  final String email;

  const AddPersonsEvents(this.fullName, this.info, this.phone, this.email);

  @override
  List<Object?> get props => [
        fullName,
        info,
        phone,
        email,
      ];
}

class DeletePersonEvents extends PersonEvent {
  final Person person;

  const DeletePersonEvents(this.person);

  @override
  List<Object?> get props => [person];
}

class UpdatePersonEvents extends PersonEvent {
  final String fullName;
  final int phone;
  final String info;
  final String email;
  final Person person;

  const UpdatePersonEvents(
    this.person,
    this.fullName,
    this.phone,
    this.info,
    this.email,
  );

  @override
  List<Object?> get props => [person];
}
