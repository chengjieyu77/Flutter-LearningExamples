import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../global.dart';
import '../../../../utils/app_colors.dart';
import '../../../../widgets/app_shadow.dart';

Widget helloText() {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hello,",
          style: TextStyle(color: AppColors.primaryText, fontSize: 20.sp),
        ),
        Text(
          Global.storageService.getUserProfile().name ?? "null",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}

Widget searchBar({FocusNode? focusNode, void Function()? onFilterTapped}) {
  return Container(
    child: Row(
      children: [
        Expanded(
          child: Container(
            height: 35.h,
            width: 285.w,
            decoration: appBoxDecorationTextField(),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 8.w,
                ),
                Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 8.w,
                ),
                Expanded(
                  child: TextField(
                    focusNode: focusNode,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintText: "Search your course",
                        hintStyle: TextStyle(fontSize: 16.sp),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          width: 20.w,
        ),
        GestureDetector(
          onTap: onFilterTapped,
          child: Container(
            decoration:
                appBoxDecorationTextField(color: AppColors.primaryElement),
            width: 35.h,
            height: 35.h,
            child: Icon(
              Icons.filter_list_rounded,
              color: Colors.white,
            ),
          ),
        )
      ],
    ),
  );
}

Widget bannerPageView({required Function(int) onPageChanged}) {
  return Container(
    width: double.infinity,
    height: 180.h,
    child: PageView.builder(
        onPageChanged: onPageChanged,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Image(image: AssetImage("assets/icons/Art.png"));
        }),
  );
}
