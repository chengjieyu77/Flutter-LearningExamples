import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../service/screenAdapter.dart';
import '../controllers/product_content_controller.dart';

class CartItemNumberView extends GetView {
  final ProductContentController controller = Get.find();
  CartItemNumberView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: ScreenAdapter.width(244),
        height: ScreenAdapter.height(64),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                controller.minusBuyNumber();
              },
              child: Container(
                height: ScreenAdapter.height(64),
                width: ScreenAdapter.width(80),
                child: Text("-"),
              ),
            ),
            Container(
              height: ScreenAdapter.height(64),
              width: ScreenAdapter.width(80),
              child: Text("${controller.buyNumber.value}"),
            ),
            InkWell(
              onTap: () {
                controller.increaseBuyNumber();
              },
              child: Container(
                height: ScreenAdapter.height(64),
                width: ScreenAdapter.width(80),
                child: Text("+"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
