import 'package:flutter/material.dart';

import 'package:get/get.dart';
//import 'package:xmshop/app/service/screenAdapter.dart';

import '../../../service/screenAdapter.dart';
import '../controllers/home_controller.dart';
import '../../../service/keepAliveWrapper.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return KeepaliveWrapper(
        child: Scaffold(
            body: Stack(
      children: [
        Positioned(
          top: -65,
          left: 0,
          right: 0,
          bottom: 0,
          child: ListView(
            controller: controller.scrollController,
            children: [
              Swiper(
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: ScreenAdapter.width(1080),
                    height: ScreenAdapter.height(682),
                    child: Image.network(
                      "https://www.itying.com/images/focus/focus02.png",
                      fit: BoxFit.cover,
                    ),
                  );
                },
                itemCount: 3,
                pagination: const SwiperPagination(),
                control: const SwiperControl(),
              ),
              SizedBox(
                width: ScreenAdapter.width(1080),
                height: ScreenAdapter.height(682),
                child: Image.network(
                  "https://www.itying.com/images/focus/focus02.png",
                  fit: BoxFit.cover,
                ),
              ),
              const Center(
                child: Text(
                  'HomeView is working',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ListTile(title: Text("1")),
              ListTile(title: Text("1")),
              ListTile(title: Text("1")),
              ListTile(title: Text("1")),
              ListTile(title: Text("1")),
              ListTile(title: Text("1")),
              ListTile(title: Text("1")),
              ListTile(title: Text("1")),
              ListTile(title: Text("1")),
              ListTile(title: Text("1")),
              ListTile(title: Text("1")),
            ],
          ),
        ),
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Obx(() => AppBar(
                  elevation: 0,
                  title: AnimatedContainer(
                    duration: Duration(milliseconds: 700),
                    width: controller.flag.value
                        ? ScreenAdapter.width(800)
                        : ScreenAdapter.width(620),
                    height: ScreenAdapter.height(96),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(175, 237, 232, 232),
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(ScreenAdapter.width(34), 2,
                          ScreenAdapter.width(34), 2),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.search),
                          SizedBox(width: 2.0),
                          Expanded(
                            flex: 1,
                            child: Text(
                              "ear phone",
                              style: TextStyle(
                                  fontSize: ScreenAdapter.fontSize(48)),
                            ),
                          ),
                          Icon(Icons.scanner_outlined),
                        ],
                      ),
                    ),
                  ),
                  centerTitle: true,
                  leading: controller.flag.value
                      ? SizedBox()
                      : IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            "/Users/yuyu/flutter_projects/xmshop/assest/xiaomi.png",
                            width: ScreenAdapter.width(54),
                            height: ScreenAdapter.height(54),
                            color: Colors.white,
                          )),
                  leadingWidth:
                      controller.flag.value ? 0 : ScreenAdapter.width(140),
                  backgroundColor:
                      controller.flag.value ? Colors.white : Colors.transparent,
                  actions: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.qr_code,
                            color: controller.flag.value
                                ? Colors.black87
                                : Colors.white)),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.message,
                            color: controller.flag.value
                                ? Colors.black87
                                : Colors.white))
                  ],
                )))
      ],
    )));
  }
}
