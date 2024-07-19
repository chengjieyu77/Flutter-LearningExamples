import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ulearningm_app/pages/login/notifier/register_notifier.dart';
import 'package:ulearningm_app/pages/login/repo/sign_up_repo.dart';
import 'package:ulearningm_app/utils/app_alerts.dart';

class SignUpController {
  late WidgetRef ref;
  SignUpController({required this.ref});
  Future<void> handleSignUp() async {
    var state = ref.read(registerNotifierProvider);
    String name = state.username;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;
    print(name);
    print(email);
    print(password);
    print(rePassword);

    if (state.username.isEmpty || name.isEmpty) {
      AppAlerts.displayToast("your username is empty");
      return;
    }

    if (state.password != state.rePassword) {
      AppAlerts.displayToast("your password didn't match");
      return;
    }
    var context = Navigator.of(ref.context);

    try {
      // final credential = await FirebaseAuth.instance
      //     .createUserWithEmailAndPassword(email: email, password: password);
      final credential = await SignUpRepo.firebaseLogin(email, password);
      if (kDebugMode) {
        print(credential);
      }
      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(name);
        AppAlerts.displayToast("An email has been sent to your email address");
        context.pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'week-password') {
        AppAlerts.displayToast("This password is too weak");
      } else if (e.code == 'invalid-email') {
        AppAlerts.displayToast("The email address is not valid");
      } else if (e.code == 'email-already-in-use') {
        AppAlerts.displayToast("The email address has already been registered");
      } else if (e.code == 'user-not-found') {
        AppAlerts.displayToast("User not found");
      }
    } catch (e) {
      print(e);
    }
  }
}
