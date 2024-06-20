import 'package:flutter/material.dart';
import 'package:telegram_clone/screens/chat_screen.dart';
import 'package:telegram_clone/screens/contacts_screen.dart';
import 'package:telegram_clone/screens/settings_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  "/chats": (context) => ChatScreen(),
  "/contacts": (context) => ContactsScreen(),
  "/settings": (context) => SettingsScreen()
};

var onGenerateRoute = (RouteSettings settings) {
  final String? name = settings.name;
  final Function? pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
  return null;
};
