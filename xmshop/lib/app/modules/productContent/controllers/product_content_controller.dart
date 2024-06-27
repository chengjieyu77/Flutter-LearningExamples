import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:xmshop/app/service/screenAdapter.dart';

class ProductContentController extends GetxController {
  //TODO: Implement ProductContentController
  RxDouble opacity = 0.0.obs;
  final ScrollController scrollController = ScrollController();
  List tabList = [
    {"id": 1, "title": "商品"},
    {"id": 2, "title": "详情"},
    {"id": 3, "title": "推荐"}
  ];
  RxInt selectedTabIndex = 1.obs;
  RxBool isTabsShown = false.obs;

  GlobalKey gk1 = GlobalKey();
  GlobalKey gk2 = GlobalKey();
  GlobalKey gk3 = GlobalKey();

  double gk2Position = 0;
  double gk3Position = 0;

  RxBool isSubHeaderShown = false.obs;
  List subTabList = [
    {"id": 1, "title": "商品介绍"},
    {"id": 2, "title": "规格参数"},
  ];
  RxInt selectedSubTabId = 1.obs;

  //保存筛选属性值
  RxString selectedAttr = "".obs;

  RxInt buyNumber = 0.obs;

  @override
  void onInit() {
    super.onInit();
    addScrollListener();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getContainerPosition(pixels) {
    RenderBox box2 = gk2.currentContext!.findRenderObject() as RenderBox;
    double gk2Position = box2.localToGlobal(Offset.zero).dy +
        pixels -
        ScreenAdapter.getStatusBarHeight() +
        ScreenAdapter.height(120); //获取纵轴的位置

    RenderBox box3 = gk3.currentContext!.findRenderObject() as RenderBox;
    double gk3Position = box3.localToGlobal(Offset.zero).dy +
        pixels -
        ScreenAdapter.getStatusBarHeight() +
        ScreenAdapter.height(120); //获取纵轴的位置

    print(gk2Position);
    print(gk3Position);
  }

  void addScrollListener() {
    scrollController.addListener(() {
      if (gk2Position == 0 && gk3Position == 0) {
        getContainerPosition(scrollController.position.pixels);
      }
      if (scrollController.position.pixels > gk2Position &&
          scrollController.position.pixels < gk3Position) {
        if (isSubHeaderShown.value == false) {
          selectedTabIndex.value == 2;
          isSubHeaderShown.value == true;
          update();
        }
      } else if (scrollController.position.pixels > 0 &&
          scrollController.position.pixels < gk2Position) {
        if (isSubHeaderShown.value == true) {
          selectedTabIndex.value == 1;
          isSubHeaderShown.value == false;
          update();
        }
      } else if (scrollController.position.pixels > gk2Position) {
        if (isSubHeaderShown.value == true) {
          selectedTabIndex.value == 3;
          isSubHeaderShown.value == false;
          update();
        }
      }

      if (scrollController.position.pixels <= 100) {
        opacity.value = scrollController.position.pixels / 100;
        if (isTabsShown.value == true) {
          isTabsShown.value == false;
        }
        if (opacity.value > 0.95) {
          opacity.value = 1;
        }
        print(opacity.value);
        update();
      } else {
        if (isTabsShown.value == false) {
          isTabsShown.value = true;
          update();
        }
      }
    });
  }

  void changeSelectedIndex(int id) {
    selectedTabIndex.value = id;

    update();
  }

  void onSubTabIdChange(int id) {
    selectedSubTabId.value = id;
    scrollController.jumpTo(gk2Position);
    update();
  }

  increaseBuyNumber() {
    buyNumber.value++;
    update();
  }

  minusBuyNumber() {
    if (buyNumber.value > 1) {
      buyNumber.value--;
      update();
    }
  }
}
