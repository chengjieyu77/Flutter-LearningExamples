import 'package:get/get.dart';

import 'package:xmshop/app/models/plist.dart';
import 'package:xmshop/app/service/httpsClient.dart';
import 'package:flutter/material.dart';

class ProductListController extends GetxController {
  //TODO: Implement ProductListController
  ScrollController scrollController = ScrollController();
  RxList<PlistItem> plist = <PlistItem>[].obs;
  RxInt page = 1.obs;
  int pageSize = 9; //每页所展示的数据条数
  bool flag = true;
  RxBool hasData = true.obs;
  String sort = "";
  Httpsclient httpsclient = Httpsclient();
  GlobalKey<ScaffoldState> scaffoldGlobalKey = GlobalKey<ScaffoldState>();
  List subHeaderList = [
    {"id": 1, "title": "综合", "fields": "all", "sort": -1},
    {"id": 2, "title": "销量", "fields": "salecount", "sort": -1},
    {"id": 3, "title": "价格", "fields": "price", "sort": -1},
    {"id": 4, "title": "筛选", "fields": "all", "sort": -1},
  ];
  RxInt selectedHeaderId = 1.obs;
  RxInt subHeaderListSort = 0.obs;

  String? searchInput = Get.arguments['searchInput'];
  String? cid = Get.arguments['cid'];
  String apiUri = "";

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void initScrolController() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >
          (scrollController.position.maxScrollExtent - 20)) {
        getPlistData();
      }
    });
  }

  getPlistData() async {
    if (flag && hasData.value) {
      flag = false;
      if (cid != null) {
        apiUri =
            "api/plist?cid=${Get.arguments["cid"]}&page=${page.value}&pageSize=$pageSize&sort=$sort";
      } else {
        apiUri =
            "api/plist?search=${Get.arguments["searchInput"]}&page=${page.value}&pageSize=$pageSize&sort=$sort";
      }
      final response = await httpsclient.get(apiUri);
      var pList = Plist.fromJson(response.data);
      plist.addAll(pList.result!);
      page.value = page.value + 1;
      flag = true;
      update();
      if (pList.result!.length < pageSize) {
        hasData.value = false;
      }
    }
  }

  changeSelectedSubId(id) {
    if (id == 4) {
      scaffoldGlobalKey.currentState!.openEndDrawer();
    } else {
      selectedHeaderId.value = id;
      sort =
          subHeaderList[id - 1]["fields"] + "_" + subHeaderList[id - 1]["sort"];
      //切换排序
      subHeaderList[id - 1]["sort"] = subHeaderList[id - 1]["sort"] * (-1);
      subHeaderListSort.value = subHeaderList[id - 1]["sort"];
      //重制数据
      page.value = 1;
      plist.value = [];
      hasData.value = true;
      scrollController.jumpTo(0);
      getPlistData();
    }
  }
}
