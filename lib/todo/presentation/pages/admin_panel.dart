import 'package:flutter/material.dart';
import 'package:fortune_wheel/fortune_wheel/domain/entities/person.dart';
import 'package:fortune_wheel/fortune_wheel/presentation/widgets/add_person.dart';
import 'package:fortune_wheel/fortune_wheel/presentation/widgets/person_item.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class AdminPanel extends StatelessWidget {
  const AdminPanel({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ValueListenableBuilder<Box<Person>>(
      valueListenable: Hive.box<Person>('person').listenable(),
      builder: (context, box, _) {
        List<Person> data = box.values.toList();
        return SafeArea(
          child: Scaffold(
            floatingActionButton: AddPerson(
              width: width,
              height: height,
            ),
            body: PersonItem(height: height, persons: data, width: width),
          ),
        );
      },
    );
  }
}
