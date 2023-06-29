import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  double width = double.infinity;
  Color background;
  bool isUpperCase = true;
  double radius = 60;
  final VoidCallback function;
  final double? horizontalSize;
  final String text;

  DefaultButton({
    Key? key,
    required this.function,
    required this.text,
    required this.background,
    this.horizontalSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalSize ?? 100,
      ),
      child: Container(
        width: width,
        height: 40.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            radius,
          ),
          color: background,
        ),
        child: MaterialButton(
          onPressed: function,
          child: Text(
            isUpperCase ? text.toUpperCase() : text,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}