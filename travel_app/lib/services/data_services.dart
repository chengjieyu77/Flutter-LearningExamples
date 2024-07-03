import 'dart:convert';

import 'package:http/http.dart' as http;
import '../model/PlacesModel.dart';

class DataServices {
  String baseUrl = "https://66838d6c4102471fa4ca6ee4.mockapi.io/api/travel/";
  Future<List<PlacesModel>> getInfo() async {
    var apiUrl = '/places';
    http.Response res = await http.get(Uri.parse(baseUrl + apiUrl));
    try {
      if (res.statusCode == 200) {
        List<dynamic> list = json.decode(res.body);
        print(list);
        return list.map((e) => PlacesModel.fromJson(e)).toList();
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
