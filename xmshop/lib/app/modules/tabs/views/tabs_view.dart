import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tabs_controller.dart';

class TabsView extends GetView<TabsController> {
  const TabsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: PageView(
            controller: controller.pageController,
            children: controller.pages,
            onPageChanged: (index) => controller.setCurrentIndex(index),
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Theme.of(context).colorScheme.primary,
            backgroundColor: Theme.of(context).colorScheme.surfaceBright,
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.currentIndex.value,
            onTap: (index) {
              //controller.currentIndex.value = index;
              controller.setCurrentIndex(index);
              controller.pageController
                  .jumpToPage(controller.currentIndex.value);
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: "首页".tr),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.category,
                  ),
                  label: "分类".tr),
              BottomNavigationBarItem(
                  icon: Icon(Icons.monitor_heart), label: "服务".tr),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: "购物车".tr),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "我的".tr),
            ],
          ),
        ));
  }
}
