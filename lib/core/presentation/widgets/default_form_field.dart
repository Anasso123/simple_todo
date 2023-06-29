import 'package:flutter/material.dart';

class DefaultFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final String hintText;
  final IconData? suffixIcon;
  final IconData prefixIcon;
  final void Function()? suffixPressed;
  final VoidCallback? onTap;
  final void Function(String)? onChanged;
  final double? horizontalSize;

  const DefaultFormField({
    Key? key,
    required this.controller,
    required this.obscureText,
    required this.keyboardType,
    required this.hintText,
    this.suffixIcon,
    this.horizontalSize,
    required this.prefixIcon,
    this.suffixPressed,
    this.onTap,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 50,
      ),
      child: Container(
        width: horizontalSize ?? width * 0.3,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(30),
        ),
        child: TextFormField(
          onTap: onTap,
          onChanged: onChanged,
          cursorColor: Colors.blueAccent,
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            suffixIcon: InkWell(
              onTap: suffixPressed,
              child: Icon(
                suffixIcon,
              ),
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Icon(
                prefixIcon,
              ),
            ),
          ),
        ),
      ),
    );
  }
}