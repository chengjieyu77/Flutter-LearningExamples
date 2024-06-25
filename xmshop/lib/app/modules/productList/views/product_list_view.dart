import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/service/screenAdapter.dart';

import '../controllers/product_list_controller.dart';

class ProductListView extends GetView<ProductListController> {
  const ProductListView({Key? key}) : super(key: key);
  Widget _productList() {
    return Obx(
      () => controller.plist.isNotEmpty
          ? ListView.builder(
              controller: controller.scrollController,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      color: Colors.white,
                      child: Row(
                        children: [
                          Container(
                              padding: EdgeInsets.all(ScreenAdapter.width(60)),
                              width: ScreenAdapter.width(400),
                              height: ScreenAdapter.height(460),
                              child: Image.network(
                                "",
                                fit: BoxFit.fitHeight,
                              )),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: ScreenAdapter.height(20)),
                                child: Text("Redmi Note 11"),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: ScreenAdapter.height(20)),
                                child: Text("descipiton"),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: ScreenAdapter.height(20)),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Column(
                                      children: [Text("1"), Text("2")],
                                    )),
                                    Expanded(
                                        child: Column(
                                      children: [Text("1"), Text("2")],
                                    )),
                                    Expanded(
                                        child: Column(
                                      children: [Text("1"), Text("2")],
                                    ))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: ScreenAdapter.height(20)),
                                child: Text("8999"),
                              )
                            ],
                          ))
                        ],
                      ),
                    ),
                    (index == controller.plist.length - 1)
                        ? _progressIndicator()
                        : SizedBox()
                  ],
                );
              })
          : _progressIndicator(),
    );
  }

  Widget _subHeader() {
    return Positioned(
        left: 0,
        right: 0,
        top: 0,
        child: Obx(
          () => Container(
              height: ScreenAdapter.height(120),
              width: ScreenAdapter.width(1080),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom: BorderSide(width: ScreenAdapter.height(1)))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: controller.subHeaderList.map((e) {
                  return Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              controller.changeSelectedSubId(e["id"]);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${e["title"]}"),
                            ),
                          ),
                          _showFilterIcon(e["id"])
                        ],
                      ));
                }).toList(),
              )),
        ));
  }

  Widget _showFilterIcon(id) {
    if (id == 2 ||
        id == 3 ||
        controller.subHeaderListSort.value == 1 ||
        controller.subHeaderListSort.value == -1) {
      if (controller.subHeaderList[id - 1]["sort"] == 1) {
        return Icon(Icons.arrow_drop_down);
      } else {
        return Icon(Icons.arrow_upward);
      }
    } else {
      return Text("");
    }
  }

  Widget _progressIndicator() {
    if (controller.hasData.value) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Center(child: Text("no more data"));
    }
  }

  @override
  Widget build(BuildContext context) {
    //Get.arguments //获取上个页面的传值
    return Scaffold(
      key: controller.scaffoldGlobalKey,
      endDrawer: Drawer(
        child: DrawerHeader(
          child: Text(""),
        ),
      ),
      backgroundColor: Color.fromARGB(175, 237, 232, 232),
      appBar: AppBar(
        title: InkWell(
          onTap: () {
            Get.offAndToNamed('/search');
          },
          child: Container(
            width: ScreenAdapter.width(900),
            height: ScreenAdapter.height(96),
            decoration: BoxDecoration(
                color: Color.fromARGB(175, 237, 232, 232),
                borderRadius: BorderRadius.circular(30)),
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  ScreenAdapter.width(34), 2, ScreenAdapter.width(34), 2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.search),
                  SizedBox(width: 2.0),
                  Expanded(
                    flex: 1,
                    child: Text(
                      "${controller.searchInput}",
                      style: TextStyle(fontSize: ScreenAdapter.fontSize(48)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        actions: [Text("")],
      ),
      body: Stack(
        children: [_productList(), _subHeader()],
      ),
    );
  }
}
