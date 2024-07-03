import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/widgets/app_large_text.dart';

import '../cubit/app_cubit_states.dart';
import '../cubit/app_cubits.dart';
import '../widgets/app_text.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  var exploreMoreImages = {
    "https://plus.unsplash.com/premium_photo-1677322684709-9d4a7a160a63?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8YmFsbG9uaW5nfGVufDB8fDB8fHww":
        "Balloning",
    "https://plus.unsplash.com/premium_photo-1690574169354-d6cc4299cf84?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8aGlraW5nfGVufDB8fDB8fHww":
        "Hiking",
    "https://images.unsplash.com/photo-1694663199049-8fe9888a1e7d?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8S2F5YWtpbmd8ZW58MHx8MHx8fDA%3D":
        "Kayaking",
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(
      length: 3,
      vsync: this,
    );
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          size: 30,
          color: Colors.black45,
        ),
        actions: [
          Container(
              width: 50,
              height: 50,
              margin: EdgeInsets.only(right: 20, top: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1719732546312-d5b34a1f87a9?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90b3MtZmVlZHwxNnx8fGVufDB8fHx8fA%3D%3D"),
                      fit: BoxFit.cover))),
        ],
      ),
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is LoadedState) {
            var info = state.places;
            return ListView(children: [
              SizedBox(
                height: 40,
              ),
              Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AppLargeText(text: "Discover"),
                    ],
                  )),
              SizedBox(
                height: 40,
              ),
              //tab bar
              Container(
                child: TabBar(
                    controller: _tabController,
                    unselectedLabelColor: Colors.grey,
                    isScrollable: true,
                    labelPadding: EdgeInsets.only(left: 20, right: 20),
                    tabAlignment: TabAlignment.start,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator:
                        CircleTabIndicator(color: Colors.blueAccent, radius: 4),
                    tabs: [
                      Tab(
                        text: "Places",
                      ),
                      Tab(
                        text: "Inspiration",
                      ),
                      Tab(
                        text: "Emotions",
                      )
                    ]),
              ),
              Container(
                width: double.maxFinite,
                height: 300,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            BlocProvider.of<AppCubits>(context)
                                .detailPage(info[index]);
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 20, top: 20),
                            width: 200,
                            height: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                image: DecorationImage(image: NetworkImage(
                                    //"https://images.unsplash.com/photo-1719764116848-13db3ebad47e?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90b3MtZmVlZHwyNHx8fGVufDB8fHx8fA%3D%3D"
                                    info[index].img), fit: BoxFit.cover)),
                            child: Column(
                              children: [
                                Text("Coscode"),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_city,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                    AppText(
                                      text: info[index].name,
                                      color: Colors.white,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: info.length,
                    ),
                    Text("2"),
                    Text("3")
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppLargeText(
                      text: "Explore more",
                      size: 22,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: AppText(
                          text: "See all",
                          color: Colors.blueAccent,
                        )),
                  ],
                ),
              ),
              Container(
                width: double.maxFinite,
                height: 200,
                margin: EdgeInsets.only(left: 20),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: exploreMoreImages.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(exploreMoreImages.keys
                                        .elementAt(index)),
                                    fit: BoxFit.cover)),
                          ),
                          AppText(
                            text: exploreMoreImages.values.elementAt(index),
                            color: Colors.black26,
                          )
                        ],
                      );
                    }),
              )
            ]);
          } else {
            return Container(
              child: Center(
                child: AppText(
                  text: "something went wrong",
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2, configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
