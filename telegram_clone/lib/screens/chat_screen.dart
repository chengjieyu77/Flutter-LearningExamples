import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: ,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        currentIndex: currentIndex,
        onTap: (index) {
          setState() {
            currentIndex = index;
          }
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Contacts",
              backgroundColor: Theme.of(context).colorScheme.surfaceBright),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: "Chats",
              backgroundColor: Theme.of(context).colorScheme.surfaceBright),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
              backgroundColor: Theme.of(context).colorScheme.surfaceBright)
        ],
      ),
    );
  }
}
