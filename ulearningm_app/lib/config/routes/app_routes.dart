import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:ulearningm_app/config/routes/route_location.dart';
import 'package:ulearningm_app/pages/welcome/welcome.dart';

import '../../pages/application/application_screen.dart';

import '../../pages/login/login.dart';
import '../../pages/login/signup.dart';

//navigationkey helps track context globally
final navigationKey = GlobalKey<NavigatorState>();
final appRoutes = [
  GoRoute(
      path: RouteLocation.welcome,
      parentNavigatorKey: navigationKey,
      builder: (context, state) => const Welcome()),
  GoRoute(
      path: RouteLocation.login,
      parentNavigatorKey: navigationKey,
      builder: (context, state) => const LoginScreen()),
  GoRoute(
      path: RouteLocation.signup,
      parentNavigatorKey: navigationKey,
      builder: (context, state) => const SignUp()),
  GoRoute(
      path: RouteLocation.home,
      parentNavigatorKey: navigationKey,
      builder: (context, state) => const ApplicationScreen()),
];
