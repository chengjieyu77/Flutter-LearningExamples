import 'package:flutter/material.dart';
import 'package:todoappmy/utils/utils.dart';

class FormTitle extends StatelessWidget {
  const FormTitle({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.textTheme.titleLarge,
    );
  }
}
