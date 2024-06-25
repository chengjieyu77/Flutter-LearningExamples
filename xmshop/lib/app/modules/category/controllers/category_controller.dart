import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../models/home_category.dart';

class CategoryController extends GetxController {
  //TODO: Implement CategoryController
  RxList<HomeCategoryItem> leftCategoryList = <HomeCategoryItem>[].obs;
  RxList<HomeCategoryItem> rightCategoryList = <HomeCategoryItem>[].obs;

  final count = 0.obs;
  RxInt selectedIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getLeftCategoryData();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeIndex(index, id) {
    selectedIndex.value = index;
    getRightCategoryData(id);
    update();
  }

  getLeftCategoryData() async {
    final response = await Dio().get("https://miapp.itying.com/api/bestCate");
    var homeCategory = HomeCategory.fromJson(response.data);
    leftCategoryList.value = homeCategory.result!;
    print(leftCategoryList[0].title);
    print(leftCategoryList[0].id);
    getRightCategoryData(leftCategoryList[0].id);
    update();
  }

  getRightCategoryData(String? id) async {
    final response =
        await Dio().get("https://xiaomi.itying.com/api/bestCate?pid=${id}");
    var homeCategory = HomeCategory.fromJson(response.data);
    rightCategoryList.value = homeCategory.result!;
    print(rightCategoryList[0].title);
    update();
  }
}
