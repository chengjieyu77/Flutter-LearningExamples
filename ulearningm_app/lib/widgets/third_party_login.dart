import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_icon.dart';

class ThirdPartyLogin extends StatelessWidget {
  const ThirdPartyLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 80, right: 80, top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LoginIcon(
            iconPath: 'assets/images/icons-google.png',
            iconColor: Colors.blueAccent,
            border: Border.all(color: Colors.black12),
          ),
          LoginIcon(
            iconPath: 'assets/images/icons-twitter.png',
            iconColor: Colors.black,
            backgroundColor: Colors.black12,
          ),
          LoginIcon(
            iconPath: 'assets/images/icons-facebook.png',
            iconColor: Colors.white,
            backgroundColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
