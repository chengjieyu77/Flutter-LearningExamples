import './storage.dart';

class Userservice {
  static getUserInfo() {
    List? userInfo = Storage.getData("userInfo");
    if (userInfo != []) {
      return userInfo;
    } else {
      return [];
    }
  }
}
