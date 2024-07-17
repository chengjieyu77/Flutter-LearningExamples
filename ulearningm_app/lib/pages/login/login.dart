import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ulearningm_app/config/routes/route_location.dart';
import 'package:ulearningm_app/pages/login/login_tab_view.dart';
import 'package:ulearningm_app/pages/login/sign_up_tab_view.dart';
import 'package:ulearningm_app/widgets/app_button.dart';
import 'package:ulearningm_app/widgets/email_password_login.dart';
import 'package:ulearningm_app/widgets/third_party_login.dart';

import '../../utils/app_alerts.dart';
import '../../utils/app_colors.dart';
import '../../widgets/login_icon.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Log in'),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: Container(
              color: Colors.black12,
              height: 1,
            ),
          )),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ThirdPartyLogin(),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'Or use your email account login',
                style: TextStyle(color: AppColors.primaryText),
              ),
            ),
            EmailPasswordLogin(
              emailController: _emailController,
              passwordController: _passwordController,
            ),
            Container(
              margin: EdgeInsets.only(left: 25, top: 16),
              child: Text(
                'Forget password?',
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
            SizedBox(
              height: 80.h,
            ),
            Container(
                width: double.infinity,
                margin: EdgeInsets.only(left: 25, right: 25),
                child: AppButton(
                  text: 'Log in',
                  onPressed: () {
                    _onLoginPressed();
                  },
                  backgroundColor: Colors.blueAccent,
                  textColor: Colors.white,
                )),
            SizedBox(
              height: 10.h,
            ),
            Container(
                width: double.infinity,
                margin: EdgeInsets.only(left: 25, right: 25),
                child: AppButton(
                  text: 'Sign Up',
                  onPressed: () {
                    context.push(RouteLocation.signup);
                  },
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                )),
          ],
        ),
      ),
    );
  }

  bool _validateEmail(String email) {
    return EmailValidator.validate(email);
  }

  bool _validatePassword(String password) {
    if (password.length > 6) {
      return true;
    }
    return false;
  }

  void _onLoginPressed() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    bool isEmailValid = _validateEmail(email);
    bool isPasswordValid = _validatePassword(password);
    bool isEmailEmpty = email.isEmpty;
    if (isEmailEmpty) {
      AppAlerts.displaySnackBar(context, "email should not be empty");
    }
    if (!isEmailEmpty && !isEmailValid) {
      AppAlerts.displaySnackBar(context, "email should be valid");
    }
    if (isEmailValid && !isPasswordValid) {
      AppAlerts.displaySnackBar(
          context, "password should be at least 6 length");
    }

    if (isPasswordValid && isEmailValid) {
      AppAlerts.displaySnackBar(context, "submitted successfully!");
    }
  }
}
