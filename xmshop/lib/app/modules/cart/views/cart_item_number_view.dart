import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../service/screenAdapter.dart';

class CartItemNumberView extends GetView {
  const CartItemNumberView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenAdapter.width(244),
      height: ScreenAdapter.height(64),
      child: Row(
        children: [
          Container(
            height: ScreenAdapter.height(64),
            width: ScreenAdapter.width(80),
            child: Text("-"),
          ),
          Container(
            height: ScreenAdapter.height(64),
            width: ScreenAdapter.width(80),
            child: Text("0"),
          ),
          Container(
            height: ScreenAdapter.height(64),
            width: ScreenAdapter.width(80),
            child: Text("+"),
          ),
        ],
      ),
    );
  }
}
