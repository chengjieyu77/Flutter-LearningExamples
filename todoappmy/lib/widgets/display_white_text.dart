import 'package:flutter/material.dart';
import 'package:todoappmy/utils/utils.dart';

class DisplayWhiteText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;

  const DisplayWhiteText(
      {super.key, required this.text, this.fontSize, this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.textTheme.headlineLarge?.copyWith(
          color: context.colorScheme.surface,
          fontSize: fontSize,
          fontWeight: fontWeight ?? FontWeight.normal),
    );
  }
}
