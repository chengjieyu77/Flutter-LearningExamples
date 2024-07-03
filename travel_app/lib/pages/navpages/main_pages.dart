import 'package:flutter/material.dart';
import 'package:travel_app/pages/homepage.dart';
import 'package:travel_app/pages/navpages/bar_item_page.dart';
import 'package:travel_app/pages/navpages/search_page.dart';

import 'my_page.dart';

class MainPages extends StatefulWidget {
  const MainPages({super.key});

  @override
  State<MainPages> createState() => _MainPagesState();
}

class _MainPagesState extends State<MainPages> {
  List pages = [
    Homepage(),
    BarItemPage(),
    SearchPage(),
    MyPage(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        elevation: 0,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.apps,
                color: Colors.black45,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart, color: Colors.black45), label: "Bar"),
          BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.black45), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.black45), label: "User"),
        ],
      ),
    );
  }
}
