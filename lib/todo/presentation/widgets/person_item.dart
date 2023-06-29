import 'package:flutter/material.dart';
import 'package:fortune_wheel/core/domain/dependency_injection/dependency_injection.dart';
import 'package:fortune_wheel/fortune_wheel/domain/entities/person.dart';
import 'package:fortune_wheel/fortune_wheel/presentation/manager/person_bloc.dart';
import 'package:fortune_wheel/fortune_wheel/presentation/widgets/update_person.dart';

class PersonItem extends StatelessWidget {
  final double height;
  final double width;
  final List<Person> persons;

  const PersonItem({
    super.key,
    required this.height,
    required this.persons,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Dismissible(
          key: UniqueKey(),
          direction: DismissDirection.endToStart,
          background: Container(
            color: Colors.red,
            child: const Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.delete, color: Colors.white),
                  SizedBox(
                    width: 8.0,
                  ),
                  Text('Move to trash', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
          onDismissed: (DismissDirection direction) {
            sl<PersonBloc>().add(DeletePersonEvents(persons[index]));
          },
          child: UpdatePerson(
            height: height,
            width: width,
            person: persons[index],
            child: ListTile(
              leading: CircleAvatar(
                child: Text(persons[index].info),
              ),
              title: Text(persons[index].fullName),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => SizedBox(
        height: height * 0.01,
      ),
      itemCount: persons.length,
    );
  }
}
