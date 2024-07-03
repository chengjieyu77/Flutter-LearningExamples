import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_text.dart';

class AppButtons extends StatelessWidget {
  Color color;
  Color backgroundColor;
  double size;
  Color borderColor;
  bool isIcon;
  String? text;
  IconData? icon;
  AppButtons({
    super.key,
    this.isIcon = false,
    this.text,
    this.icon,
    required this.color,
    required this.backgroundColor,
    required this.size,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: 5),
        width: size,
        height: size,
        decoration: BoxDecoration(
            border: Border.all(color: borderColor, width: 1),
            borderRadius: BorderRadius.circular(10),
            color: backgroundColor),
        child: isIcon
            ? Icon(
                icon,
                color: color,
              )
            : AppText(
                text: text!,
                color: color,
              ));
  }
}
