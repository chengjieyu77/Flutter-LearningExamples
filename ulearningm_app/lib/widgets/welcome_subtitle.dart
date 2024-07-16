import 'package:flutter/cupertino.dart';

class WelcomeSubtitle extends StatelessWidget {
  const WelcomeSubtitle({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 18),
      textAlign: TextAlign.center,
    );
  }
}
