import 'package:fortune_wheel/fortune_wheel/domain/entities/person.dart';

class NoParams {}

class PersonParams {
  final Person? person;
  final String fullName;
  final String email;
  final int phone;
  final String info;

  PersonParams({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.info,
    this.person,
  });
}
