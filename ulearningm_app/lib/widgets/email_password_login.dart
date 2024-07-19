import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearningm_app/pages/login/notifier/login_notifier.dart';
import 'package:ulearningm_app/utils/app_colors.dart';
import 'package:ulearningm_app/widgets/form_textfield.dart';

class EmailPasswordLogin extends StatelessWidget {
  const EmailPasswordLogin({
    super.key,
    required this.emailController,
    required this.passwordController,
    this.onTapOutside,
    this.myFocusNode,
    this.onEmailChange,
    this.onPasswordChange,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  //final PointerDownEventListener? onPointerDown;
  final Function(PointerDownEvent)? onTapOutside;
  final FocusNode? myFocusNode;
  final void Function(String)? onEmailChange;
  final void Function(String)? onPasswordChange;

  // final TextEditingController passwordController;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            FormTextfield(
              label: 'Email',
              icon: Icons.person,
              hintText: 'Enter your email address',
              textInputType: TextInputType.emailAddress,
              onChanged: onEmailChange,
              controller: emailController,
              onTapOutside: onTapOutside,
              myFocusNode: myFocusNode,
              textInputAction: TextInputAction.next,
            ),
            SizedBox(
              height: 25,
            ),
            FormTextfield(
              label: 'Password',
              icon: Icons.lock,
              hintText: 'Enter your Password',
              textInputType: TextInputType.visiblePassword,
              isPassword: true,
              onChanged: onPasswordChange,
              controller: passwordController,
              textInputAction: TextInputAction.done,
            )
          ],
        ));
  }
}
