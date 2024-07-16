import 'package:flutter/material.dart';
import 'package:todoappmy/widgets/form_title.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField(
      {super.key,
      required this.text,
      required this.hintText,
      this.controller,
      required this.inputType,
      this.maxLines,
      this.suffixIcon,
      this.readOnly = false});
  final String text;
  final String hintText;
  final TextEditingController? controller;
  final TextInputType inputType;
  final int? maxLines;
  final Widget? suffixIcon;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormTitle(text: text),
        const SizedBox(
          height: 10,
        ),
        TextField(
          readOnly: readOnly,
          controller: controller,
          keyboardType: inputType,
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          decoration:
              InputDecoration(hintText: hintText, suffixIcon: suffixIcon),
          onChanged: (value) {},
          maxLines: maxLines,
        ),
      ],
    );
  }
}
