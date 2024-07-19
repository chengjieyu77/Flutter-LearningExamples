import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ulearningm_app/config/routes/route_location.dart';
import 'package:ulearningm_app/pages/welcome/welcome_controller.dart';
import 'package:ulearningm_app/providers/welcome_index_provider.dart';
import 'package:ulearningm_app/utils/app_constants.dart';
import 'package:ulearningm_app/utils/bar_height.dart';
import 'package:ulearningm_app/utils/welcome_resource.dart';
import 'package:ulearningm_app/widgets/app_button.dart';
import 'package:ulearningm_app/widgets/app_onboarding_page.dart';
import 'package:ulearningm_app/widgets/welcome_subtitle.dart';
import 'package:ulearningm_app/widgets/welcome_title.dart';

import '../../global.dart';

class Welcome extends ConsumerWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PageController pageController = PageController();
    int pageIndex = ref.watch(welcomeIndexProvider);

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (value) {
              ref.read(welcomeIndexProvider.notifier).state = value;
            },
            controller: pageController,
            children: [
              AppOnboardingPage(
                  imageAsset: WelcomeResource.welcomeImages[0],
                  title: WelcomeResource.welcomeTitles[0],
                  subTitle: WelcomeResource.welcomeSubtitles[0],
                  index: 0,
                  onButtonPressed: () {}),
              AppOnboardingPage(
                  imageAsset: WelcomeResource.welcomeImages[1],
                  title: WelcomeResource.welcomeTitles[1],
                  subTitle: WelcomeResource.welcomeSubtitles[1],
                  index: 1,
                  onButtonPressed: () {}),
              AppOnboardingPage(
                  imageAsset: WelcomeResource.welcomeImages[2],
                  title: WelcomeResource.welcomeTitles[2],
                  subTitle: WelcomeResource.welcomeSubtitles[2],
                  index: 2,
                  onButtonPressed: () {}),
            ],
          ),
          Positioned(
              bottom: BarHeight.ActionsBarHeight(context),
              left: 16,
              right: 16,
              child: AppButton(
                backgroundColor: Colors.blueAccent,
                textColor: Colors.white,
                text: pageIndex == 2 ? 'Get Started' : 'Next',
                onPressed: pageIndex == 2
                    ? () {
                        WelcomeController.routeToLoginOrHome(context);
                      }
                    : () {
                        pageController.animateToPage(pageIndex + 1,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.linear);
                        //pageController.jumpToPage(pageIndex + 1);
                      },
              )),
          Positioned(
            top: BarHeight.StatusBarHeight(context),
            right: 0,
            child: TextButton(
              child: Text('Skip'),
              onPressed: () {
                WelcomeController.routeToLoginOrHome(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
