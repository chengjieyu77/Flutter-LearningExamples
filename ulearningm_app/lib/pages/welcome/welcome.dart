import 'package:flutter/material.dart';
import 'package:ulearningm_app/utils/bar_height.dart';
import 'package:ulearningm_app/utils/welcome_resource.dart';
import 'package:ulearningm_app/widgets/app_button.dart';
import 'package:ulearningm_app/widgets/welcome_subtitle.dart';
import 'package:ulearningm_app/widgets/welcome_title.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
              controller: pageController,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                      top: BarHeight.StatusBarHeight(context),
                      left: 16,
                      right: 16),
                  child: Column(
                    children: [
                      Container(
                        child:
                            Image.asset(WelcomeResource.welcomeImages[index]),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      WelcomeTitle(text: WelcomeResource.welcomeTitles[index]),
                      SizedBox(
                        height: 20,
                      ),
                      WelcomeSubtitle(
                          text: WelcomeResource.welcomeSubtitles[index]),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(3, (indexDots) {
                          return Container(
                            margin: EdgeInsets.only(left: 5),
                            width: index == indexDots ? 25 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: index == indexDots
                                    ? Colors.blueAccent
                                    : Colors.black45),
                          );
                        }),
                      ),
                      index == 2
                          ? AppButton(
                              text: 'Get Started',
                              onPressed: () {},
                            )
                          : AppButton(
                              text: 'Next',
                              onPressed: () {
                                pageController.jumpToPage(index + 1);
                              },
                            )
                    ],
                  ),
                );
              }),
          Positioned(
              bottom: BarHeight.ActionsBarHeight(context),
              left: 16,
              right: 16,
              child: AppButton(
                text: 'Next',
                onPressed: () {},
              )),
          Positioned(
            top: BarHeight.StatusBarHeight(context),
            right: 0,
            child: TextButton(
              child: Text('Skip'),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
