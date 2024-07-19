import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearningm_app/utils/app_colors.dart';

class CourseChoiceSection extends StatelessWidget {
  const CourseChoiceSection(
      {super.key,
      required this.controller,
      required this.courseIndex,
      this.onTap});
  final TabController controller;
  final int courseIndex;
  final Function(int)? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 250.w,
            height: 40.h,
            child: TabBar(
                //isScrollable: true,
                //tabAlignment: TabAlignment.start,
                onTap: onTap,
                controller: controller,
                indicatorColor: Colors.black,
                dividerHeight: 0,
                tabs: <Widget>[
                  courseTab(
                      courseIndex: courseIndex, originIndex: 0, label: "All"),
                  courseTab(
                      courseIndex: courseIndex,
                      originIndex: 1,
                      label: "Popular"),
                  courseTab(
                      courseIndex: courseIndex, originIndex: 2, label: "New"),
                ]),
          ),
          Container(
            height: 200.h,
            child: TabBarView(
                controller: controller,
                //physics: ScrollPhysics(),
                children: [
                  GridView.builder(
                      physics: ScrollPhysics(),
                      itemCount: 4,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        return Text("1");
                      }),
                  Text("2"),
                  Text("3")
                ]),
          )
        ],
      ),
    );
  }
}

Tab courseTab(
    {required int courseIndex,
    required int originIndex,
    required String label}) {
  return Tab(
    child: Container(
      height: 25.h,
      width: 60.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: courseIndex == originIndex
              ? AppColors.primaryElement
              : Colors.white),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
              color: courseIndex == originIndex ? Colors.white : Colors.black),
        ),
      ),
    ),
  );
}
