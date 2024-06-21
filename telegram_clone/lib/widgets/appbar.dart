import 'package:flutter/material.dart';
import 'package:telegram_clone/screens/chat_screen.dart';
import 'package:telegram_clone/screens/contacts_screen.dart';
import 'package:telegram_clone/screens/settings_screen.dart';

List<Widget> bodyList = [ContactsScreen(), ChatScreen(), SettingsScreen()];
List<Widget> leadingList = [
  TextButton(
    onPressed: () {},
    child: Text("Sort"),
  ),
  TextButton(
    onPressed: () {},
    child: Text("Edit"),
  ),
  IconButton(
    onPressed: () {},
    icon: Icon(Icons.qr_code_scanner),
  )
];
List<String> titleList = ["Contacts", "Chats", " "];
List<List<Widget>> actionsList = [
  [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
  [
    IconButton(onPressed: () {}, icon: Icon(Icons.add)),
    IconButton(onPressed: () {}, icon: Icon(Icons.messenger_outline_rounded)),
  ],
  [TextButton(onPressed: () {}, child: Text("Edit"))],
];
