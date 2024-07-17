import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class FormTextfield extends StatelessWidget {
  const FormTextfield(
      {super.key,
      required this.label,
      this.hintText,
      required this.icon,
      this.textInputType,
      this.isPassword = false,
      this.onChanged,
      required this.controller});
  final String label;
  final String? hintText;
  final IconData icon;
  final TextInputType? textInputType;
  final bool isPassword;
  final void Function(String)? onChanged;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: AppColors.primaryText),
        ),
        Container(
            height: 50,
            decoration: appBoxDecorationTextField(),
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: TextField(
                keyboardType: textInputType,
                decoration: InputDecoration(
                    icon: Icon(icon),
                    hintText: hintText,
                    border: InputBorder.none),
                onChanged: onChanged,
                maxLines: 1,
                autocorrect: false,
                autofocus: false,
                obscureText: isPassword,
                controller: controller,
              ),
            )),
      ],
    );
  }
}

BoxDecoration appBoxDecorationTextField(
    {Color color = Colors.white54,
    double radius = 15,
    Color borderColor = Colors.black26}) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: borderColor));
}
