import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearningm_app/pages/application/home/notifier/home_index_provider.dart';
import 'package:ulearningm_app/pages/application/home/widget/widget.dart';
import 'package:ulearningm_app/utils/app_colors.dart';
import 'package:ulearningm_app/utils/app_constants.dart';
import 'package:ulearningm_app/utils/image_resource.dart';
import 'package:ulearningm_app/widgets/app_shadow.dart';
import 'package:ulearningm_app/widgets/page_view_dots.dart';

import '../../../../global.dart';
import '../../../../widgets/course_choice_section.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeState();
}

class _HomeState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late FocusNode _focusNode;

  void _unfocusTextField() {
    if (!_focusNode.hasPrimaryFocus) {
      _focusNode.unfocus();
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int index = ref.watch(homeBannerIndexProvider);
    int courseIndex = ref.watch(homeCourseIndexProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.list),
        title: Center(child: Text("Home")),
        actions: [
          //user photo
          Container(
              margin: EdgeInsets.only(right: 16.w), child: Icon(Icons.person))
        ],
      ),
      body: GestureDetector(
        onTap: _unfocusTextField,
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w),
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                helloText(),
                SizedBox(
                  height: 20.h,
                ),
                searchBar(focusNode: _focusNode, onFilterTapped: () {}),
                bannerPageView(
                  onPageChanged: (index) {
                    ref.read(homeBannerIndexProvider.notifier).state = index;
                  },
                ),
                PageViewDots(index: index),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      "Choose your course",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp),
                    ),
                    Text("See all")
                  ],
                ),
                CourseChoiceSection(
                  controller: _tabController,
                  courseIndex: courseIndex,
                  onTap: (index) {
                    ref.read(homeCourseIndexProvider.notifier).state = index;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
