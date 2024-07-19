import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ulearningm_app/config/routes/route_location.dart';
import 'package:ulearningm_app/data/models/user.dart';
import 'package:ulearningm_app/pages/login/notifier/login_state.dart';
import 'package:ulearningm_app/pages/login/repo/login_repo.dart';
import 'package:ulearningm_app/utils/app_alerts.dart';
import 'package:ulearningm_app/utils/app_constants.dart';

import '../../global.dart';
import '../../providers/apploader_provider.dart';
import 'notifier/login_notifier.dart';

class LoginController {
  //WidgetRef ref;
  LoginController();

  Future<void> handleLogin(WidgetRef ref, BuildContext context) async {
    var state = ref.read(loginNotifierProvider);
    String email = state.email;
    String password = state.password;
    print(email);
    print(password);
    if (email.isEmpty || password.isEmpty) {
      AppAlerts.displayToast("email or password should not be empty");
    }

    ref.read(apploaderProvider.notifier).state = true;
    print(1);
    try {
      print(2);
      // final credential = await FirebaseAuth.instance
      //     .signInWithEmailAndPassword(email: email, password: password);
      final credential = await LoginRepo.firebaseLogin(email, password);
      print(3);
      if (kDebugMode) {
        print(credential);
      }
      if (credential.user == null) {
        AppAlerts.displayToast("user not found");
        return;
      }
      if (!credential.user!.emailVerified) {
        AppAlerts.displayToast("email has not been verified");
        return;
      }
      if (credential.user != null) {
        String? displayName = credential.user?.displayName;
        String? email = credential.user?.email;
        String? id = credential.user?.uid;
        String? photoUrl = credential.user?.photoURL;

        LoginRequestEntity loginRequestEntity = LoginRequestEntity();
        loginRequestEntity.avatar = photoUrl;
        loginRequestEntity.email = email;
        loginRequestEntity.name = displayName;
        loginRequestEntity.open_id = id;
        loginRequestEntity.type = 1;
        postLoginEntity(loginRequestEntity, ref, context);
        print("user logged in");
      }
      // } on FirebaseAuthException catch (e) {
      //   if (e.code == 'invalid-email') {
      //     AppAlerts.displayToast("This email is not valid");
      //   } else if (e.code == 'wrong-password') {
      //     AppAlerts.displayToast("password is wrong");
      //   } else if (e.code == 'user-not-found') {
      //     AppAlerts.displayToast("User not found");
      //   }
    } catch (e) {
      print(4);
      AppAlerts.displayToast("Either email or password is invalid");
      print(e);
    }
    //ref.read(apploaderProvider.notifier).state = false;
  }

  void postLoginEntity(LoginRequestEntity loginRequestEntity, WidgetRef ref,
      BuildContext context) {
    ref.read(apploaderProvider.notifier).state = false;
    //when successfully login, send information to server

    //have local storage to store user info
    try {
      //var context = ref.context;
      Global.storageService.setString(AppConstants.STORAGE_USER_PROFILE_KEY,
          jsonEncode({"name": "yuyu", "email": "sssss"}));
      Global.storageService
          .setString(AppConstants.STORAGE_USER_TOKEN_KEY, "ss");
      //go to different page

      context.go(RouteLocation.home);
    } catch (e) {
      print(5);
      print(e);
    }
  }
}
