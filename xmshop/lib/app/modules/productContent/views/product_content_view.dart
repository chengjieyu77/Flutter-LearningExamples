import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../service/screenAdapter.dart';
import '../controllers/product_content_controller.dart';
import './first_page_view.dart';
import 'second_page_view.dart';
import 'third_page_view.dart';
import 'cart_item_number_view.dart';

class ProductContentView extends GetView<ProductContentController> {
  const ProductContentView({Key? key}) : super(key: key);

//action 1筛选属性 2加入购物车 3立即购买
  void showBottomAttr(int action) {
    Get.bottomSheet(GetBuilder<ProductContentController>(
        init: controller,
        builder: (controller) {
          return Container(
            color: Colors.white,
            padding: EdgeInsets.all(ScreenAdapter.width(20)),
            width: double.infinity,
            height: ScreenAdapter.height(1200),
            child: Stack(children: [
              ListView(
                children: [CartItemNumberView()],
              ),
              Positioned(
                  //left: ScreenAdapter.width(1000),
                  right: ScreenAdapter.width(0),
                  top: 0,
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.close))),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: action == 1
                    ? Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: ScreenAdapter.height(120),
                              margin: EdgeInsets.only(
                                  right: ScreenAdapter.width(20)),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor:
                                        WidgetStateProperty.all(Colors.amber),
                                    shape: WidgetStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)))),
                                child: Text("加入购物车"),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: ScreenAdapter.height(120),
                              margin: EdgeInsets.only(
                                  right: ScreenAdapter.width(20)),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor:
                                        WidgetStateProperty.all(Colors.red),
                                    shape: WidgetStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)))),
                                child: Text("立即购买"),
                              ),
                            ),
                          ),
                        ],
                      )
                    : ElevatedButton(
                        onPressed: () {
                          Get.back();
                          if (action == 2) {
                          } else {}
                        },
                        child: Text("确定"),
                      ),
              )
            ]),
          );
        }));
  }

  Widget _appbar(context) {
    return Obx(
      () => AppBar(
        leading: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(2),
          child: ElevatedButton(
              onPressed: () {
                Get.back();
              },
              style: ButtonStyle(
                  alignment: Alignment.center,
                  padding: WidgetStateProperty.all(EdgeInsets.zero),
                  backgroundColor: WidgetStateProperty.all(Colors.amberAccent),
                  foregroundColor: WidgetStateProperty.all(Colors.white),
                  shape: WidgetStateProperty.all(CircleBorder())),
              child: Icon(
                Icons.arrow_back,
              )),
        ),
        elevation: 0,
        title: Container(
            //width: ScreenAdapter.width(400),
            //height: ScreenAdapter.height(96),
            child: controller.isTabsShown.value
                ? Row(
                    children: controller.tabList.map((element) {
                    return Padding(
                      padding: EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          controller.changeSelectedIndex(element["id"]);
                          if (element["id"] == 1) {
                            Scrollable.ensureVisible(
                                controller.gk1.currentContext as BuildContext,
                                duration: Duration(milliseconds: 100));
                          } else if (element["id"] == 2) {
                            Scrollable.ensureVisible(
                                controller.gk2.currentContext as BuildContext,
                                duration: Duration(milliseconds: 100));
                            Timer.periodic(Duration(milliseconds: 101),
                                (timer) {
                              controller.scrollController.jumpTo(
                                  controller.scrollController.position.pixels -
                                      ScreenAdapter.height(120));
                              timer.cancel();
                            });
                          } else {
                            Scrollable.ensureVisible(
                                controller.gk3.currentContext as BuildContext,
                                duration: Duration(milliseconds: 100));
                            Timer.periodic(Duration(milliseconds: 101),
                                (timer) {
                              controller.scrollController.jumpTo(
                                  controller.scrollController.position.pixels -
                                      ScreenAdapter.height(120));
                              timer.cancel();
                            });
                          }
                        },
                        child: Column(children: [
                          Text(
                            element["title"],
                            style:
                                TextStyle(fontSize: ScreenAdapter.fontSize(34)),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            width: ScreenAdapter.width(100),
                            height: ScreenAdapter.height(6),
                            color: element["id"] ==
                                    controller.selectedTabIndex.value
                                ? Colors.red
                                : Colors.transparent,
                          )
                        ]),
                      ),
                    );
                  }).toList())
                : Text("")),
        backgroundColor: Colors.white.withOpacity(controller.opacity.value),
        centerTitle: true,
        actions: [
          ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  padding: WidgetStateProperty.all(EdgeInsets.zero),
                  backgroundColor: WidgetStateProperty.all(Colors.amberAccent),
                  foregroundColor: WidgetStateProperty.all(Colors.white),
                  shape: WidgetStateProperty.all(CircleBorder())),
              child: Icon(
                Icons.file_upload_outlined,
              )),
          ElevatedButton(
              onPressed: () {
                showMenu(
                    color: Colors.black87.withOpacity(0.7),
                    context: context,
                    position: RelativeRect.fromLTRB(
                        ScreenAdapter.width(600),
                        ScreenAdapter.height(250),
                        ScreenAdapter.width(20),
                        ScreenAdapter.height(20)),
                    items: [
                      PopupMenuItem(
                          child: Row(
                        children: [Icon(Icons.home), Text("首页")],
                      )),
                      PopupMenuItem(
                          child: Row(
                        children: [Icon(Icons.home), Text("首页")],
                      )),
                      PopupMenuItem(
                          child: Row(
                        children: [Icon(Icons.home), Text("首页")],
                      )),
                    ]);
              },
              style: ButtonStyle(
                  padding: WidgetStateProperty.all(EdgeInsets.zero),
                  backgroundColor: WidgetStateProperty.all(Colors.amberAccent),
                  foregroundColor: WidgetStateProperty.all(Colors.white),
                  shape: WidgetStateProperty.all(CircleBorder())),
              child: Icon(
                Icons.more_horiz_outlined,
              )),
        ],
      ),
    );
  }

  Widget _subHeader() {
    return Obx(
      () => Container(
          color: Colors.white,
          child: Row(
              children: controller.subTabList.map((element) {
            return Expanded(
                child: InkWell(
              onTap: () {
                controller.onSubTabIdChange(element["id"]);
              },
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  element["title"],
                  style: TextStyle(
                      color: element["id"] == controller.selectedSubTabId.value
                          ? Colors.red
                          : Colors.black),
                ),
              ),
            ));
          }).toList())),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
        controller: controller.scrollController,
        child: Column(
          children: [
            FirstPageView(),
            SecondPageView(_subHeader),
            ThirdPageView(),
          ],
        ));
  }

  Widget _bottom() {
    return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          height: ScreenAdapter.height(180),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  top: BorderSide(
                      width: ScreenAdapter.width(2), color: Colors.black))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: ScreenAdapter.height(30)),
                alignment: Alignment.center,
                width: ScreenAdapter.width(200),
                height: ScreenAdapter.height(160),
                child: InkWell(
                  onTap: () {
                    Get.toNamed('/cart');
                  },
                  child: Column(
                    children: [Icon(Icons.shopping_cart), Text("购物车")],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: ScreenAdapter.height(120),
                  margin: EdgeInsets.only(right: ScreenAdapter.width(20)),
                  child: ElevatedButton(
                    onPressed: () {
                      showBottomAttr(1);
                    },
                    style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.amber),
                        shape: WidgetStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)))),
                    child: Text("加入购物车"),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: ScreenAdapter.height(120),
                  margin: EdgeInsets.only(right: ScreenAdapter.width(20)),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.red),
                        shape: WidgetStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)))),
                    child: Text("立即购买"),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
            preferredSize:
                Size(ScreenAdapter.width(1080), ScreenAdapter.height(120)),
            child: _appbar(context)),
        body: Stack(
          children: [
            _body(),
            _bottom(),
            Obx(() => controller.isSubHeaderShown.value
                ? Positioned(
                    left: 0,
                    right: 0,
                    top: ScreenAdapter.getStatusBarHeight() +
                        ScreenAdapter.height(120),
                    child: _subHeader())
                : Text("")),
          ],
        ));
  }
}
