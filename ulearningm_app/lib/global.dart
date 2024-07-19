import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearningm_app/services/storage.dart';

import 'firebase_options.dart';

class Global {
  static late StorageService storageService;
  static Future init() async {
    await ScreenUtil.ensureScreenSize();
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    storageService = await StorageService().init();
  }
}
