import 'package:flutter/material.dart';
import 'package:fortune_wheel/core/domain/dependency_injection/dependency_injection.dart';
import 'package:fortune_wheel/core/presentation/widgets/default_button.dart';
import 'package:fortune_wheel/core/presentation/widgets/default_form_field.dart';
import 'package:fortune_wheel/fortune_wheel/domain/entities/person.dart';
import 'package:fortune_wheel/fortune_wheel/presentation/manager/person_bloc.dart';

class UpdatePerson extends StatefulWidget {
  final double width;
  final double height;
  final Person person;
  final Widget child;

  const UpdatePerson({
    super.key,
    required this.width,
    required this.height,
    required this.person,
    required this.child,
  });

  @override
  State<UpdatePerson> createState() => _UpdatePersonState();
}

class _UpdatePersonState extends State<UpdatePerson> {
  late TextEditingController infoController;

  late TextEditingController fullNameController;

  late TextEditingController phoneController;

  late TextEditingController emailController;

  @override
  void initState() {
    infoController = TextEditingController(text: widget.person.info);
    fullNameController = TextEditingController(text: widget.person.fullName);
    phoneController = TextEditingController(text: '${widget.person.phone}');
    emailController = TextEditingController(text: widget.person.email);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(widget.person.fullName);
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: widget.height * 0.02,
                ),
                DefaultFormField(
                  horizontalSize: widget.width,
                  controller: fullNameController,
                  obscureText: false,
                  keyboardType: TextInputType.name,
                  hintText: 'Name',
                  prefixIcon: Icons.text_fields,
                ),
                SizedBox(
                  height: widget.height * 0.02,
                ),
                DefaultFormField(
                  horizontalSize: widget.width,
                  controller: phoneController,
                  obscureText: false,
                  keyboardType: TextInputType.phone,
                  hintText: 'Phone',
                  prefixIcon: Icons.phone,
                ),
                SizedBox(
                  height: widget.height * 0.02,
                ),
                DefaultFormField(
                  horizontalSize: widget.width,
                  controller: emailController,
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  hintText: 'Email',
                  prefixIcon: Icons.email,
                ),
                SizedBox(
                  height: widget.height * 0.02,
                ),
                DefaultFormField(
                  horizontalSize: widget.width,
                  controller: infoController,
                  obscureText: false,
                  keyboardType: TextInputType.text,
                  hintText: 'Info',
                  prefixIcon: Icons.info,
                ),
                SizedBox(
                  height: widget.height * 0.02,
                ),
                DefaultButton(
                  function: () {
                    if (fullNameController.text.isNotEmpty ||
                        infoController.text.isNotEmpty ||
                        phoneController.text.isNotEmpty ||
                        infoController.text.isNotEmpty) {
                      sl<PersonBloc>().add(UpdatePersonEvents(
                        widget.person,
                        fullNameController.text,
                        int.parse(phoneController.text),
                        infoController.text,
                        emailController.text,
                      ));
                      Navigator.pop(context);
                    }
                  },
                  text: 'Update Person',
                  background: Colors.blue,
                ),
                SizedBox(
                  height: widget.height * 0.02,
                ),
              ],
            );
          },
        );
      },
      child: widget.child,
    );
  }
}
