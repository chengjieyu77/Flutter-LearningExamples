import 'package:flutter/material.dart';

import 'package:get/get.dart';
//import 'package:xmshop/app/service/screenAdapter.dart';

import '../../../service/screenAdapter.dart';
import '../controllers/home_controller.dart';
import '../../../service/keepAliveWrapper.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  //appbar
  Widget _appbar() {
    return AppBar(
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
                  "ear phone",
                  style: TextStyle(fontSize: ScreenAdapter.fontSize(48)),
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
      leadingWidth: controller.flag.value ? 0 : ScreenAdapter.width(140),
      backgroundColor:
          controller.flag.value ? Colors.white : Colors.transparent,
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(Icons.qr_code,
                color: controller.flag.value ? Colors.black87 : Colors.white)),
        IconButton(
            onPressed: () {},
            icon: Icon(Icons.message,
                color: controller.flag.value ? Colors.black87 : Colors.white))
      ],
    );
  }

  Widget _mySwiper() {
    return SizedBox(
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.height(682),
      child: Obx(
        () => Swiper(
          itemBuilder: (context, index) {
            //public\upload\o0jddkfje-sjfjnag.png
            //String picUrl = "https://xiaomi.itying.com/${controller.swiperlist[index]["pic"]}"
            //picUrl.replaceAll("\\","/")
            //String picUrl = "https://xiaomi.itying.com/${controller.swiperlist3[index].url}"
            return Image.network(
              //controller.swiperList[index]["url"],
              //controller.swiperList2[index]["url"],
              controller.swiperList3[index].url!,

              fit: BoxFit.cover,
            );
          },
          itemCount: controller.swiperList3.length,
          pagination: const SwiperPagination(builder: SwiperPagination.rect),
          autoplay: true,
          //loop: true,
        ),
      ),
      // ),
    );
  }

//banner
  Widget _banner() {
    return SizedBox(
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.height(92),
      child: Image.asset(
        "assest/images/xiaomiBanner.png",
        fit: BoxFit.cover,
      ),
    );
  }

  //home Category
  Widget _homeCategory() {
    return SizedBox(
        width: ScreenAdapter.width(1080),
        height: ScreenAdapter.height(470),
        child: Swiper(
          itemBuilder: (context, index) {
            return GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: ScreenAdapter.width(20)),
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      Container(
                          alignment: Alignment.center,
                          width: ScreenAdapter.width(130),
                          height: ScreenAdapter.width(130),
                          child: Image.network(
                            "https://plus.unsplash.com/premium_photo-1678897742200-85f052d33a71?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                            fit: BoxFit.fitHeight,
                          )),
                      Text(
                        "手机",
                        //controller.homecategoryList[index*0 + i].title!,
                        style: TextStyle(fontSize: ScreenAdapter.fontSize(34)),
                      )
                    ],
                  );
                });
          },
          itemCount: 2, //controller.homecategoryList.length ~/ 10,
          pagination: SwiperPagination(
              margin: const EdgeInsets.all(0.0),
              builder: SwiperCustomPagination(
                  builder: (BuildContext context, SwiperPluginConfig config) {
                return ConstrainedBox(
                  constraints: const BoxConstraints.expand(height: 50.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: const RectSwiperPaginationBuilder(
                                  color: Color.fromARGB(31, 218, 211, 211),
                                  activeColor:
                                      Color.fromARGB(255, 129, 115, 115),
                                  size: Size(30, 2),
                                  activeSize: Size(30, 2))
                              .build(context, config),
                        ),
                      )
                    ],
                  ),
                );
              })),
        )
        // ),
        );
  }

  Widget _banner2() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          ScreenAdapter.width(20), 0, ScreenAdapter.width(20), 0),
      child: Container(
        height: ScreenAdapter.height(420),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(ScreenAdapter.width(20)),
            image: const DecorationImage(
                image: AssetImage("assest/images/xiaomiBanner2.png"),
                fit: BoxFit.cover)),
      ),
    );
  }

  Widget _homePage() {
    return Positioned(
      top: -65,
      left: 0,
      right: 0,
      bottom: 0,
      child: ListView(
        controller: controller.scrollController,
        children: [
          _mySwiper(),
          _banner(),
          _homeCategory(),
          _banner2(),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return KeepaliveWrapper(
        child: Scaffold(
            body: Stack(
      children: [
        _homePage(),
        Positioned(top: 0, left: 0, right: 0, child: Obx(() => _appbar()))
      ],
    )));
  }
}
