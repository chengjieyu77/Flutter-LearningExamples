import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearningm_app/pages/application/home/view/home_screen.dart';
import 'package:ulearningm_app/utils/app_colors.dart';

var bottomTabs = <BottomNavigationBarItem>[
  appBottomNavigationBarItem(
      icon: Icons.home,
      label: "Home",
      activeColor: AppColors.activeIcon,
      inactiveColor: AppColors.inactiveIcon),
  appBottomNavigationBarItem(
      icon: Icons.search,
      label: "Search",
      activeColor: AppColors.activeIcon,
      inactiveColor: AppColors.inactiveIcon),
  appBottomNavigationBarItem(
      icon: Icons.play_arrow,
      label: "Play",
      activeColor: AppColors.activeIcon,
      inactiveColor: AppColors.inactiveIcon),
  appBottomNavigationBarItem(
      icon: Icons.message,
      label: "Message",
      activeColor: AppColors.activeIcon,
      inactiveColor: AppColors.inactiveIcon),
  appBottomNavigationBarItem(
      icon: Icons.person,
      label: "User",
      activeColor: AppColors.activeIcon,
      inactiveColor: AppColors.inactiveIcon),
];

BottomNavigationBarItem appBottomNavigationBarItem(
    {IconData icon = Icons.add,
    String label = "Home",
    Color activeColor = Colors.blueAccent,
    Color inactiveColor = Colors.white30}) {
  return BottomNavigationBarItem(
      icon: SizedBox(
        width: 15.w,
        height: 15.w,
        child: Icon(
          icon,
          color: inactiveColor,
        ),
      ),
      label: label,
      activeIcon: SizedBox(
        width: 15.w,
        height: 15.w,
        child: Icon(icon, color: activeColor),
      ));
}

Widget appScreens({int index = 0}) {
  List<Widget> _screens = [
    HomeScreen(),
    Center(child: Text("search")),
    Center(child: Text("play")),
    Center(child: Text("4")),
    Center(child: Text("5")),
  ];
  return _screens[index];
}
