import 'dart:convert';

import 'package:crypto/crypto.dart';

class SignService {
  static String getSign(Map json) {
    //1.get salt response when successfullly logins in

    //2.get all attributes

    //3.generate a map object

    //4. sort keys in map //should be the same with server side

    //5. concatenate all the keys with their values in one string

    //6. encode the string md5

    List jsonKeys = json.keys.toList();
    jsonKeys.sort();
    String str = '';
    for (var i = 0; i < jsonKeys.length; i++) {
      str += "${jsonKeys[i]}${json[jsonKeys[i]]}";
    }
    var sign = md5.convert(utf8.encode(str));
    return "$sign";
  }
}
