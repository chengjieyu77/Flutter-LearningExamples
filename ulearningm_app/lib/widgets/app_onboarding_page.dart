import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ulearningm_app/widgets/page_view_dots.dart';
import 'package:ulearningm_app/widgets/welcome_subtitle.dart';
import 'package:ulearningm_app/widgets/welcome_title.dart';

import '../utils/bar_height.dart';
import 'app_button.dart';

class AppOnboardingPage extends StatelessWidget {
  const AppOnboardingPage(
      {super.key,
      required this.imageAsset,
      required this.title,
      required this.subTitle,
      required this.index,
      required this.onButtonPressed});
  final String imageAsset;
  final String title;
  final String subTitle;
  final int index;
  final Function onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: BarHeight.StatusBarHeight(context), left: 16, right: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Image.asset(imageAsset),
            ),
            SizedBox(
              height: 20,
            ),
            WelcomeTitle(text: title),
            SizedBox(
              height: 20,
            ),
            WelcomeSubtitle(text: subTitle),
            SizedBox(
              height: 16,
            ),
            PageViewDots(index: index),
            index == 2
                ? AppButton(
                    backgroundColor: Colors.blueAccent,
                    textColor: Colors.white,
                    text: 'Get Started',
                    onPressed: () {},
                  )
                : AppButton(
                    backgroundColor: Colors.blueAccent,
                    textColor: Colors.white,
                    text: 'Next',
                    onPressed: () {
                      onButtonPressed();
                    },
                  )
          ],
        ),
      ),
    );
    ;
  }
}
