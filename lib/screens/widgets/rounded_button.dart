import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String name;
  final Color bgColor;
  final Color primaryColor;
  final VoidCallback function;

  const RoundedButton({
    Key? key,
    required this.name,
    required this.bgColor,
    required this.primaryColor,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: this.bgColor,
        primary: this.primaryColor,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
      ),
      onPressed: this.function,
      child: Text(this.name),
    );
  }
}
