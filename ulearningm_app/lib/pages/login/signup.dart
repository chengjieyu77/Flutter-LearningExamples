import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearningm_app/pages/login/notifier/register_notifier.dart';
import 'package:ulearningm_app/pages/login/sign_up_controller.dart';

import '../../utils/app_colors.dart';
import '../../widgets/app_button.dart';
import '../../widgets/form_textfield.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();

  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final regProvider = ref.watch(registerNotifierProvider);

    return Scaffold(
      appBar: AppBar(
          title: Text('Signup'),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: Container(
              color: Colors.black12,
              height: 1,
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: Text(
                'Enter your details below & free sign up',
                style: TextStyle(color: AppColors.primaryText),
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 25, right: 25),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    FormTextfield(
                      label: 'User name',
                      icon: Icons.person,
                      hintText: 'Enter your user name',
                      textInputType: TextInputType.text,
                      onChanged: (value) {
                        ref
                            .read(registerNotifierProvider.notifier)
                            .onUserNameChange(value);
                      },
                      controller: usernameController,
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    FormTextfield(
                      label: 'Email',
                      icon: Icons.person,
                      hintText: 'Enter your email address',
                      textInputType: TextInputType.emailAddress,
                      onChanged: (value) {
                        ref
                            .read(registerNotifierProvider.notifier)
                            .onEmailChange(value);
                      },
                      controller: emailController,
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    FormTextfield(
                      label: 'Password',
                      icon: Icons.lock,
                      hintText: 'Enter your Password',
                      textInputType: TextInputType.visiblePassword,
                      isPassword: true,
                      onChanged: (value) {
                        ref
                            .read(registerNotifierProvider.notifier)
                            .onPasswordChange(value);
                      },
                      controller: passwordController,
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    FormTextfield(
                      label: 'Confirm Password',
                      icon: Icons.lock,
                      hintText: 'Confirm your Password',
                      textInputType: TextInputType.visiblePassword,
                      isPassword: true,
                      onChanged: (value) {
                        ref
                            .read(registerNotifierProvider.notifier)
                            .onRePasswordChange(value);
                      },
                      controller: passwordConfirmController,
                      textInputAction: TextInputAction.done,
                    ),
                  ],
                )),
            SizedBox(
              height: 20.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 20.w),
              child: Text(
                "By creating an account you have to agree with our terms and conditions",
                style: TextStyle(color: AppColors.primaryText),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Container(
                width: double.infinity,
                margin: EdgeInsets.only(left: 25, right: 25),
                child: AppButton(
                  text: 'Sign Up',
                  onPressed: () {
                    _onSignupPressed();
                    SignUpController(ref: ref).handleSignUp();
                  },
                  backgroundColor: Colors.blueAccent,
                  textColor: Colors.white,
                )),
          ],
        ),
      ),
    );
  }

  void _onSignupPressed() {
    final username = usernameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
  }
}
