import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ulearningm_app/utils/app_colors.dart';
import 'package:ulearningm_app/widgets/login_icon.dart';

import '../../widgets/email_password_login.dart';

class LoginTabView extends StatelessWidget {
  const LoginTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    return Column(
      children: [
        Container(
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
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Or use your email account login',
          style: TextStyle(color: AppColors.primaryText),
        ),
      ],
    );
  }
}
