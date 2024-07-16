import 'package:flutter/material.dart';
import 'package:todoappmy/config/config.dart';
import 'package:todoappmy/config/routes/routes.dart';
import 'package:todoappmy/screens/screens.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoApp extends ConsumerWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routerConfig = ref.watch(routesProvider);
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        routerConfig: routerConfig);
  }
}
