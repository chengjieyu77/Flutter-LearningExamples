import 'package:get/get.dart';

class MySearchController extends GetxController {
  //TODO: Implement SearchController

  final count = 0.obs;
  String searchInput = "";
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
