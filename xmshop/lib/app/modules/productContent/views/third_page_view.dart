import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/service/screenAdapter.dart';

import '../controllers/product_content_controller.dart';

class ThirdPageView extends GetView {
  final ProductContentController controller = Get.find();
  ThirdPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      key: controller.gk3,
      height: ScreenAdapter.height(2400),
    );
  }
}
