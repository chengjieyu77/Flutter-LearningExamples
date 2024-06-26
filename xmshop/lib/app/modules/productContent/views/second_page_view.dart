import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/service/screenAdapter.dart';

import '../controllers/product_content_controller.dart';

class SecondPageView extends GetView {
  final ProductContentController controller = Get.find();
  final Function subHeader;
  SecondPageView(this.subHeader, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      key: controller.gk2,
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.height(2400),
      child: Column(
        children: [
          subHeader(),
          Obx(() {
            return controller.selectedSubTabId.value == 1
                ? Text("This is id=1")
                : Text("This is id=2");
          })
        ],
      ),
    );
  }
}
