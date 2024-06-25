import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:xmshop/app/models/home_category.dart';
import 'package:xmshop/app/models/plist.dart';
import '../../../models/shop.dart';
import '../../../models/focus_model.dart';
import '../../../models/home_category.dart';

import 'dart:convert';

class HomeController extends GetxController {
  //浮动导航开关
  RxBool flag = false.obs;
  //scrollcontroller
  final ScrollController scrollController = ScrollController();
  //swiper list
  // RxList swiperList = [].obs;
  List swiperList = [
    {"url": "https://www.itying.com/images/focus/focus02.png"},
    {"url": "https://www.itying.com/images/focus/focus01.png"}
  ];
  RxList<FocusModelItem> bestSellingSwiperList = <FocusModelItem>[].obs;

  RxList swiperList2 = [].obs;
  RxList<FocusModelItem> swiperList3 = <FocusModelItem>[].obs;

  //homeCategory
  RxList<HomeCategoryItem> homecategoryList = <HomeCategoryItem>[].obs;

  RxList<PlistItem> plist = <PlistItem>[].obs;
  RxList<PlistItem> bestPlist = <PlistItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    addScrollListener();
    getHomeCategoryData();
    getFocusData();
    getBestSelllingFocusData();
    getPlistData();
    getBestPlistData();
    //formatJson();
  }

  void addScrollListener() {
    scrollController.addListener(() {
      if (scrollController.position.pixels > 10 &&
          scrollController.position.pixels < 20) {
        if (flag.value == false) {
          flag.value = true;
          update();
        }
      }
      if (scrollController.position.pixels < 10) {
        if (flag.value == true) {
          flag.value = false;
          update();
        }
      }
    });
  }

  getBestPlistData() async {
    final response =
        await Dio().get("https://miapp.itying.com/api/plist?is_best=1");
    var pList = Plist.fromJson(response.data);
    bestPlist.value = pList.result!;
    print(bestPlist[0].pic);
    update();
  }

  getPlistData() async {
    final response = await Dio()
        .get("https://miapp.itying.com/api/plist?is_hot=1&pageSize=3");
    var pList = Plist.fromJson(response.data);
    plist.value = pList.result!;
    print(plist[0].pic);
    update();
  }

  getHomeCategoryData() async {
    final response = await Dio().get("https://miapp.itying.com/api/bestCate");
    var homeCategory = HomeCategory.fromJson(response.data);
    homecategoryList.value = homeCategory.result!;
    update();
    // final response = await rootBundle.loadString('assest/home_category.json');
    // print(response);
  }

  getFocusData() async {
    final response = await Dio().get("https://miapp.itying.com/api/focus");
    //swiperList2.value = response.data["result"];
    var focus = FocusModel.fromJson(response.data);

    swiperList3.value = focus.result!;
    print(swiperList3[0].pic);
    update();

    // final response = await rootBundle.loadString('assest/focus_raw.json');
    // final data = await json.decode(response);
    // //swiperList.value = data["result"];
    // //print(data["result"]);
    // swiperList2.value = data["result"];
    // print(response);
    // print(data);
    // print(data["result"]);

    // update();
  }

  void getBestSelllingFocusData() async {
    final response =
        await Dio().get("https://miapp.itying.com/api/focus?position=2");
    //bestSellingSwiperList.value = response.data["result"];
    var focus = FocusModel.fromJson(response.data);

    bestSellingSwiperList.value = focus.result!;
    print(bestSellingSwiperList[0].pic);
    update();
  }

  void formatJson() {
    String jsonStr =
        '{"id": "1", "title": "米家智能炸烤箱", "url": "https://www.itying.com/images/focus/focus02.png", "status": 1}';
    ShopModel shop = ShopModel.fromJson(json.decode(jsonStr));
    print(shop.title);
  }

  @override
  void onClose() {
    super.onClose();
  }
}
