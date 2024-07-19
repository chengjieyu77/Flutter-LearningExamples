import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulearningm_app/data/models/user.dart';
import 'package:ulearningm_app/utils/app_constants.dart';

class StorageService {
  late final SharedPreferences _pref;
  Future<StorageService> init() async {
    _pref = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setString(String key, String value) async {
    return await _pref.setString(key, value);
  }

  getString(String key) {
    return _pref.getString(key) ?? "the string of key is empty";
  }

  Future<bool> setBoll(String key, bool value) async {
    return await _pref.setBool(key, value);
  }

  bool getDeviceFirstOpen() {
    return _pref.getBool(AppConstants.STORAGE_FIRST_OPEN_DEVICE) ?? false;
  }

  bool isLoggedIn() {
    return _pref.getString(AppConstants.STORAGE_USER_PROFILE_KEY) != null
        ? true
        : false;
  }

  UserProfile getUserProfile() {
    String profile =
        _pref.getString(AppConstants.STORAGE_USER_PROFILE_KEY) ?? "";
    var jsonProfile = jsonDecode(profile);
    var userProfile = UserProfile.fromJson(jsonProfile);
    return userProfile;
  }
}
