import 'package:flutter/material.dart';
import 'package:telegram_clone/routers.dart';
import 'package:telegram_clone/screens/chat_screen.dart';
import 'package:telegram_clone/screens/contacts_screen.dart';
import 'package:telegram_clone/screens/settings_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Telegram clone",
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple)),
        initialRoute: "/chats",
        routes: routes);
    //onGenerateRoute: onGenerateRoute);
  }
}
