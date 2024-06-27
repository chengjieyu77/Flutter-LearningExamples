import 'package:flutter/material.dart';
import 'package:xmshop/app/service/screenAdapter.dart';

class Passbutton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const Passbutton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Text(text));
  }
}
