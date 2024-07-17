import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.backgroundColor,
      required this.textColor});
  final String text;
  final Function() onPressed;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
      style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
    );
  }
}
