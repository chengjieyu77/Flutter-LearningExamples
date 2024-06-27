import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/service/screenAdapter.dart';

import '../controllers/user_controller.dart';

class UserView extends GetView<UserController> {
  const UserView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Row(
            children: [
              Text("会员码"),
              IconButton(onPressed: () {}, icon: Icon(Icons.qr_code)),
              IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
              IconButton(onPressed: () {}, icon: Icon(Icons.message)),
            ],
          )
        ],
      ),
      body: ListView(
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  width: ScreenAdapter.width(150),
                  height: ScreenAdapter.height(150),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(ScreenAdapter.width(75)),
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://images.unsplash.com/photo-1718511609335-a261357388a1?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                          fit: BoxFit.cover)),
                ),
                InkWell(
                    onTap: () {
                      Get.toNamed('/code-login-step-one');
                    },
                    child: Text("登录/注册")),
                Icon(Icons.arrow_forward)
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(flex: 1, child: Text("收藏")),
                    Expanded(flex: 1, child: Text("收藏")),
                    Expanded(flex: 1, child: Text("收藏")),
                  ],
                ),
                Container(
                  child: Row(
                    children: [],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
