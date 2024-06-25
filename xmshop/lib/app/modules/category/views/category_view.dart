import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/service/screenAdapter.dart';

import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: InkWell(
            onTap: () {
              Get.toNamed('/search');
            },
            child: Container(
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
                        "搜索商品",
                        style: TextStyle(fontSize: ScreenAdapter.fontSize(48)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.message, color: Colors.black87))
          ],
        ),
        body: Row(
          children: [
            SizedBox(
              width: ScreenAdapter.width(280),
              height: double.infinity,
              child: Obx(
                () => ListView.builder(
                    itemCount: controller.leftCategoryList.length,
                    itemBuilder: ((context, index) {
                      return Container(
                        width: double.infinity,
                        height: ScreenAdapter.height(180),
                        child: Obx(
                          () => InkWell(
                            onTap: () {
                              controller.changeIndex(index,
                                  controller.rightCategoryList[index].id);
                            },
                            child: Stack(children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                    width: ScreenAdapter.width(10),
                                    height: ScreenAdapter.height(46),
                                    color:
                                        controller.selectedIndex.value == index
                                            ? Colors.red
                                            : Colors.white),
                              ),
                              Center(
                                child: Text(
                                    "${controller.leftCategoryList[index].title}"),
                              )
                            ]),
                          ),
                        ),
                      );
                    })),
              ),
            ),
            Expanded(
              child: Container(
                height: 400,
                child: Obx(
                  () => GridView.builder(
                      itemCount: controller.rightCategoryList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: ScreenAdapter.width(40),
                          mainAxisExtent: ScreenAdapter.height(20),
                          childAspectRatio: 240 / 340),
                      itemBuilder: (context, index) {
                        String pic =
                            "https://xiaomi.itying/${controller.rightCategoryList[index].url}";
                        return InkWell(
                          onTap: () {
                            Get.toNamed("/product-list", arguments: {
                              "cid": controller.rightCategoryList[index].id
                            });
                          },
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: double.infinity,
                                child: Image.network(
                                  //"https://xiaomi.itying.com/public/upload/RQXtJTh1WbzxpSbLF-vjDYTo.png",
                                  pic.replaceAll("\\", "/"),
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    0, ScreenAdapter.height(0), 0, 0),
                                child: Text(
                                  "${controller.rightCategoryList[index].title}",
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(34)),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                ),
              ),
            )
          ],
        ));
  }
}
