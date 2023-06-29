import 'package:flutter/material.dart';
import 'package:fortune_wheel/core/domain/dependency_injection/dependency_injection.dart';
import 'package:fortune_wheel/core/presentation/widgets/default_button.dart';
import 'package:fortune_wheel/core/presentation/widgets/default_form_field.dart';
import 'package:fortune_wheel/fortune_wheel/presentation/manager/person_bloc.dart';

class AddPerson extends StatelessWidget {
  final double width;
  final double height;

  AddPerson({
    super.key,
    required this.width,
    required this.height,
  });

  final TextEditingController infoController = TextEditingController();

  final TextEditingController fullNameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: height * 0.02,
                ),
                DefaultFormField(
                  horizontalSize: width,
                  controller: fullNameController,
                  obscureText: false,
                  keyboardType: TextInputType.name,
                  hintText: 'Name',
                  prefixIcon: Icons.text_fields,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                DefaultFormField(
                  horizontalSize: width,
                  controller: phoneController,
                  obscureText: false,
                  keyboardType: TextInputType.phone,
                  hintText: 'Phone',
                  prefixIcon: Icons.phone,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                DefaultFormField(
                  horizontalSize: width,
                  controller: emailController,
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  hintText: 'Email',
                  prefixIcon: Icons.email,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                DefaultFormField(
                  horizontalSize: width,
                  controller: infoController,
                  obscureText: false,
                  keyboardType: TextInputType.text,
                  hintText: 'Info',
                  prefixIcon: Icons.info,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                DefaultButton(
                  function: () {
                    if (fullNameController.text.isNotEmpty ||
                        infoController.text.isNotEmpty ||
                        phoneController.text.isNotEmpty ||
                        infoController.text.isNotEmpty) {
                      sl<PersonBloc>().add(AddPersonsEvents(
                          fullNameController.text,
                          infoController.text,
                          int.parse(phoneController.text.trim()),
                          emailController.text.trim()));
                      Navigator.pop(context);
                    }
                  },
                  text: 'Add Person',
                  background: Colors.blue,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
              ],
            );
          },
        );
      },
      child: const Icon(Icons.add),
    );

  }
}
