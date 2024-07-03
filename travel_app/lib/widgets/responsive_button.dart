import 'package:flutter/material.dart';

class ResponsiveButton extends StatelessWidget {
  double? width;
  bool isResponsive;
  String? text;
  ResponsiveButton(
      {super.key, this.width, this.isResponsive = false, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.blueAccent),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        isResponsive
            ? Text(
                text!,
                style: TextStyle(color: Colors.white, fontSize: 18),
              )
            : Text(""),
        isResponsive
            ? SizedBox(
                width: 30,
              )
            : Text(""),
        Image.asset(
          "images/fast-forward.png",
          color: Colors.white12,
        )
      ]),
    );
  }
}
