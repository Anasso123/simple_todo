import 'package:hive/hive.dart';
part 'person.g.dart';

@HiveType(typeId: 1)
class Person extends HiveObject{
  @HiveField(0)
  late String fullName;
  @HiveField(1, defaultValue: '')
  late String email;
  @HiveField(2, defaultValue: 0)
  late int phone;
  @HiveField(3)
  late String info;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Person &&
          runtimeType == other.runtimeType &&
          fullName == other.fullName &&
          email == other.email &&
          phone == other.phone &&
          info == other.info;

  @override
  int get hashCode =>
      fullName.hashCode ^ email.hashCode ^ phone.hashCode ^ info.hashCode;
}

