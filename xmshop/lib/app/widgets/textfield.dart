import 'package:flutter/material.dart';
import 'package:xmshop/app/service/screenAdapter.dart';

class PassTextField extends StatelessWidget {
  final String hintText;
  final void Function(String)? onCanged;
  const PassTextField(
      {super.key, required this.hintText, required this.onCanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      style: TextStyle(fontSize: ScreenAdapter.fontSize(48)),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(hintText: hintText, border: InputBorder.none),
      onChanged: onCanged,
    );
  }
}
