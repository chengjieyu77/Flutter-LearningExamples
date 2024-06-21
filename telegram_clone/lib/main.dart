import 'package:flutter/material.dart';
import 'package:telegram_clone/routers.dart';
import 'package:telegram_clone/widgets/appbar.dart';
import 'widgets/appbar.dart' as CustomAppbar;

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
      home: BottomNav(),
      // initialRoute: "/chats",
      // routes: routes,
      // onGenerateRoute: onGenerateRoute,
    );
  }
}

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: leadingList[_currentIndex],
          centerTitle: true,
          title:Text(titleList[_currentIndex]),
          actions: actionsList[_currentIndex]),

      body: bodyList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
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
