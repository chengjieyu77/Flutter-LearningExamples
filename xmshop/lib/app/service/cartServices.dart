import './storage.dart';

class CartServices {
  //
  static setHistoryData(String searchInput) async {
    List? searchList = await Storage.getData("searchList");
    if (searchList != null) {
      var hasData = searchList.any((value) {
        return value == searchInput;
      });
      if (!hasData) {
        searchList.add(searchInput);
        await Storage.setData("searchList", searchList);
      }
    } else {
      List tempList = [];
      tempList.add(searchInput);
      await Storage.setData("searcList", tempList);
    }
  }

  static Future<List> getHistoryData() async {
    List? searchList = await Storage.getData("searchList");
    if (searchList != null) {
      return searchList;
    } else {
      return [];
    }
  }

  static deleteHistoryData(searchInput) async {
    List? searchList = await Storage.getData("searchList");
    if (searchList != null) {
      searchList.remove(searchInput);
      await Storage.setData("searchList", searchList);
    }
  }

  static clearHistoryData() async {
    await Storage.clearData();
  }
}
