import 'package:fortune_wheel/core/domain/params/params.dart';
import 'package:fortune_wheel/fortune_wheel/domain/entities/person.dart';
import 'package:hive/hive.dart';

abstract class BasePersonDatasource {
  Future<Box<Person>> getPerson();

  Future<void> addPerson(PersonParams params);

  Future<void> deletePerson(Person person);

  Future<void> updatePerson(PersonParams params);
}

class PersonDatasource implements BasePersonDatasource {
  @override
  Future<Box<Person>> getPerson() async {
    return Hive.box<Person>('person');
  }

  @override
  Future<void> addPerson(PersonParams params) async {
    final person = Person()
      ..fullName = params.fullName
      ..info = params.info
      ..phone = params.phone
      ..email = params.email;

    final box = Hive.box<Person>('person');
    box.add(person);
  }

  @override
  Future<void> deletePerson(Person person) async{
    await person.delete();
  }

  @override
  Future<void> updatePerson(PersonParams params) async {
    params.person!.fullName = params.fullName;
    params.person!.info = params.info;
    params.person!.email = params.email;
    params.person!.phone = params.phone;
    await params.person!.save();
  }


}
