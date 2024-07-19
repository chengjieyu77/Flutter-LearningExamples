import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../config/routes/route_location.dart';
import '../../global.dart';
import '../../utils/app_constants.dart';

class WelcomeController {
  WelcomeController();

  static void routeToLoginOrHome(BuildContext context) {
    bool isLoggedIn = Global.storageService.isLoggedIn();
    if (isLoggedIn) {
      Global.storageService
          .setBoll(AppConstants.STORAGE_FIRST_OPEN_DEVICE, true);
      context.go(RouteLocation.home);
    } else {
      context.push(RouteLocation.login);
    }
  }
}
