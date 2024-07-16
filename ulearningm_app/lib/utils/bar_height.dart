import 'package:flutter/cupertino.dart';

class BarHeight {
  BarHeight._();

  static double StatusBarHeight(BuildContext context) {
    return MediaQuery.of(context).viewPadding.top;
  }

  static double ActionsBarHeight(BuildContext context) {
    return MediaQuery.of(context).viewPadding.bottom;
  }
}
