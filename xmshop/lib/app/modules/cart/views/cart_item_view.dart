import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/modules/cart/views/cart_item_number_view.dart';
import 'package:xmshop/app/service/screenAdapter.dart';

class CartItemView extends GetView {
  const CartItemView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(ScreenAdapter.width(20), 0,
          ScreenAdapter.width(20), ScreenAdapter.width(20)),
      width: ScreenAdapter.width(1080),
      child: Row(
        children: [
          Container(
            width: ScreenAdapter.width(20),
            child: Checkbox(value: true, onChanged: (value) {}),
          ),
          SizedBox(
            width: ScreenAdapter.width(40),
          ),
          Container(
            width: ScreenAdapter.width(260),
            height: ScreenAdapter.height(260),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(
                      "https://www.itying.com/images/focus/focus02.png",
                    ),
                    fit: BoxFit.cover)),
          ),
          Expanded(
              child: Column(
            children: [
              Text("蓝牙支架"),
              Text(""),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("89"), CartItemNumberView()],
              )
            ],
          ))
        ],
      ),
    );
  }
}
