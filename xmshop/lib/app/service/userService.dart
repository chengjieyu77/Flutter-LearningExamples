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

  static bool getUserLoginState(){
    List userInfo = getUserInfo();
    if(userInfo.isNotEmpty && userInfo[0]["username"] != ""){  //userInfo != [] 判断的是地址不相等
      return true;
    }else{
      return false;
    }
  }
}
