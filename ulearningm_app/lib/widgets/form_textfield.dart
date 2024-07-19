import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import 'app_shadow.dart';

class FormTextfield extends StatelessWidget {
  const FormTextfield(
      {super.key,
      required this.label,
      this.hintText,
      required this.icon,
      this.textInputType,
      this.isPassword = false,
      this.onChanged,
      required this.controller,
      this.onTapOutside,
      this.myFocusNode,
      required this.textInputAction});
  final String label;
  final String? hintText;
  final IconData icon;
  final TextInputType? textInputType;
  final bool isPassword;
  final void Function(String)? onChanged;
  final TextEditingController controller;
  final Function(PointerDownEvent)? onTapOutside;
  final FocusNode? myFocusNode;
  final TextInputAction textInputAction;

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
                onTapOutside: onTapOutside,
                focusNode: myFocusNode,
                textInputAction: textInputAction,
              ),
            )),
      ],
    );
  }
}
