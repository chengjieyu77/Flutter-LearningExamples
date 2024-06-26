import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/service/screenAdapter.dart';

import '../controllers/search_controller.dart';

import '../../../service/searchServices.dart';

class SearchView extends GetView<MySearchController> {
  const SearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //     onPressed: () {
        //       Get.offAndToNamed('/category');
        //     },
        //     icon: Icon(Icons.arrow_back)),
        title: Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(175, 237, 232, 232),
              borderRadius: BorderRadius.circular(30)),
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                ScreenAdapter.width(34), 2, ScreenAdapter.width(34), 2),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: TextField(
                    onChanged: (value) {
                      controller.searchInput = value;
                    },
                    onSubmitted: (value) {
                      SearchServices.setHistoryData(controller.searchInput);
                      Get.toNamed('/product-list',
                          arguments: {"searchInput": value});
                    },
                    autofocus: true,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        )),
                    style: TextStyle(fontSize: ScreenAdapter.fontSize(34)),
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (controller.searchInput.isNotEmpty) {
                SearchServices.setHistoryData(controller.searchInput);
                Get.offAndToNamed('/product-list',
                    arguments: {'searchInput': controller.searchInput});
              }
            },
            child: Text("搜索"),
          )
        ],
      ),
      body: ListView(
        children: [
          Obx(
            () => controller.historyList.isNotEmpty
                ? Padding(
                    padding: EdgeInsets.fromLTRB(
                        ScreenAdapter.width(20),
                        ScreenAdapter.width(10),
                        ScreenAdapter.width(20),
                        ScreenAdapter.width(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("搜索历史"),
                        IconButton(
                            onPressed: () {
                              controller.clearHistoryData();
                            },
                            icon: Icon(Icons.delete))
                      ],
                    ),
                  )
                : Text(""),
          ),
          Obx(
            () => Wrap(
                children: controller.historyList.map((value) {
              return GestureDetector(
                onLongPress: () {
                  controller.removeSingleHistoryData(value);
                },
                child: Row(
                  children: [Text("$value")],
                ),
              );
            }).toList()),
          )
        ],
      ),
    );
  }
}
