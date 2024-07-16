import 'package:flutter/cupertino.dart';

class WelcomeTitle extends StatelessWidget {
  const WelcomeTitle({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}
