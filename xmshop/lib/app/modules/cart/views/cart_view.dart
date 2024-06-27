import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'cart_item_view.dart';
import 'package:xmshop/app/service/screenAdapter.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView {
  CartController controller = Get.put(CartController());
  CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('CartView'),
          centerTitle: true,
        ),
        body: GetBuilder<CartController>(
          init: controller,
          initState: (state) {
            //controller.getCartListData()
          },
          builder: (controller) {
            return Stack(
              children: [
                ListView(
                  children: [CartItemView(), CartItemView(), CartItemView()],
                ),
                Positioned(
                  right: 0,
                  left: 0,
                  bottom: 0,
                  child: Container(
                    margin:
                        EdgeInsets.fromLTRB(0, 0, ScreenAdapter.width(20), 0),
                    width: ScreenAdapter.width(1080),
                    height: ScreenAdapter.height(190),
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(
                                color: Colors.black12,
                                width: ScreenAdapter.width(2)))),
                    child: Row(
                      textBaseline: TextBaseline.ideographic,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                                value: true,
                                onChanged: (value) {
                                  print(value);
                                }),
                            Text("全选")
                          ],
                        ),
                        Row(
                          children: [
                            Text("合计"),
                            SizedBox(
                              width: ScreenAdapter.width(40),
                            ),
                            Text("98.9"),
                            ElevatedButton(onPressed: () {}, child: Text("结算"))
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ));
  }
}
