import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todoappmy/config/routes/routes.dart';
import 'package:todoappmy/screens/create_task_screen.dart';
import 'package:todoappmy/screens/screens.dart';

final navigationKey = GlobalKey<NavigatorState>();
final appRoutes = [
  GoRoute(
    path: RouteLocation.home,
    parentNavigatorKey: navigationKey,
    builder: (context, state) => HomeScreen(),
  ),
  GoRoute(
    path: RouteLocation.createTask,
    parentNavigatorKey: navigationKey,
    builder: (context, state) => CreateTaskScreen(),
  ),
];
