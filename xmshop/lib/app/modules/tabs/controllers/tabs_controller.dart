import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../cart/views/cart_view.dart';
import '../../category/views/category_view.dart';
import '../../give/views/give_view.dart';
import '../../home/views/home_view.dart';
import '../../user/views/user_view.dart';

class TabsController extends GetxController {
  RxInt currentIndex = 0.obs;
  //var currentPage = HomeView().obs; page不是响应式变量
  PageController pageController = PageController(initialPage: 0);

  final List<Widget> pages = [
    HomeView(),
    CategoryView(),
    GiveView(),
    CartView(),
    UserView()
  ];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setCurrentIndex(index) {
    currentIndex.value = index;
    update();
  }
}
