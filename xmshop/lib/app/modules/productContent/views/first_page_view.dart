import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/service/screenAdapter.dart';

import '../controllers/product_content_controller.dart';

class FirstPageView extends GetView {
  final ProductContentController controller = Get.find();
  FirstPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenAdapter.width(1080),
      key: controller.gk1,
      child: Column(
        children: [
          Container(
            width: ScreenAdapter.width(1080),
            height: ScreenAdapter.height(2400),
            color: Colors.amber,
          )
        ],
      ),
    );
  }
}
