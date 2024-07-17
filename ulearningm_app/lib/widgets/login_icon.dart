import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginIcon extends StatelessWidget {
  const LoginIcon(
      {super.key,
      required this.iconPath,
      this.backgroundColor,
      required this.iconColor,
      this.border});
  final String iconPath;
  final Color? backgroundColor;
  final Color iconColor;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: backgroundColor, border: border),
        child: ImageIcon(
          AssetImage(
            iconPath,
          ),
          color: iconColor,
        ),
      ),
    );
  }
}
