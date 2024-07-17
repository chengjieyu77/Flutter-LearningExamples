import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:ulearningm_app/config/routes/route_location.dart';
import 'package:ulearningm_app/pages/welcome/welcome.dart';

import '../../pages/login/login.dart';
import '../../pages/login/signup.dart';

final navigationKey = GlobalKey<NavigatorState>();
final appRoutes = [
  GoRoute(
      path: RouteLocation.welcome,
      parentNavigatorKey: navigationKey,
      builder: (context, state) => const Welcome()),
  GoRoute(
      path: RouteLocation.login,
      parentNavigatorKey: navigationKey,
      builder: (context, state) => const Login()),
  GoRoute(
      path: RouteLocation.signup,
      parentNavigatorKey: navigationKey,
      builder: (context, state) => const SignUp()),
];
