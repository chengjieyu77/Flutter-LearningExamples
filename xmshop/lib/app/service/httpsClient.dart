import 'dart:io';

import 'package:dio/dio.dart';

class Httpsclient {
  static String domain = "https://xiaomi.itying.com";
  static Dio dio = Dio();
  HttpsClient() {
    dio.options.baseUrl = domain;
    dio.options.connectTimeout = Duration(seconds: 5);
    dio.options.receiveTimeout = Duration(seconds: 3);
  }

  Future get(apiUrl) async {
    try {
      var response = await dio.get(apiUrl);
      return response;
    } catch (e) {
      print(e);
      return null;
    }
  }

  static replaceUri(picUri) {
    String tempUrl = domain + picUri;
    return tempUrl.replaceAll("\\", "/");
  }
}