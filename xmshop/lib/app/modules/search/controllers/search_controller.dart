import 'package:get/get.dart';
import 'package:xmshop/app/service/searchServices.dart';

class MySearchController extends GetxController {
  //TODO: Implement SearchController

  String searchInput = "";
  RxList historyList = [].obs;
  @override
  void onInit() {
    super.onInit();
    getHistoryData();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getHistoryData() async {
    var tempList = await SearchServices.getHistoryData();
    if (tempList.isNotEmpty) {
      historyList.value = tempList;
      //historyList.addAll(tempList)
      update();
    }
  }

  clearHistoryData() async {
    await SearchServices.clearHistoryData();
    historyList.value = [];
    //historyList.clear()
    update();
  }

  removeSingleHistoryData(searchInput) async {
    await SearchServices.deleteHistoryData(searchInput);
    getHistoryData();
    update();
  }
}
