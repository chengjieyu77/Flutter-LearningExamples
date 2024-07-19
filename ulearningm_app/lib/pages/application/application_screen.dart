import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearningm_app/pages/application/notifier/application_nav_notifier.dart';
import 'package:ulearningm_app/pages/application/widgets/widget.dart';

import 'package:ulearningm_app/utils/app_colors.dart';
import 'package:ulearningm_app/widgets/app_shadow.dart';

class ApplicationScreen extends ConsumerWidget {
  const ApplicationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int index = ref.watch(applicationNavIndexProvider);
    return Scaffold(
      body: appScreens(index: index),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 58.h,
        decoration: appBoxShadowWithRadius(),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: index,
          onTap: (index) {
            ref.read(applicationNavIndexProvider.notifier).changeIndex(index);
          },
          // selectedItemColor: AppColors.activeIcon,
          // unselectedItemColor: AppColors.inactiveIcon,
          elevation: 2,
          items: bottomTabs,
          showUnselectedLabels: false,
          showSelectedLabels: false,
        ),
      ),
    );
  }
}
