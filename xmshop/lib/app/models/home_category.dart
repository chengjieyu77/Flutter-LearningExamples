class HomeCategory {
  List<HomeCategoryItem>? result;

  HomeCategory({this.result});

  HomeCategory.fromJson(Map<String, dynamic> json) {
    if (json["result"] is List) {
      result = json["result"] == null
          ? null
          : (json["result"] as List)
              .map((e) => HomeCategoryItem.fromJson(e))
              .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (result != null) {
      _data["result"] = result?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class HomeCategoryItem {
  String? id;
  String? title;
  String? url;
  String? pid;
  int? sort;
  int? isBest;
  int? goProduct;
  String? productionId;

  HomeCategoryItem(
      {this.id,
      this.title,
      this.url,
      this.pid,
      this.sort,
      this.isBest,
      this.goProduct,
      this.productionId});

  HomeCategoryItem.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["pic"] is String) {
      url = json["pic"];
    }
    if (json["pid"] is String) {
      pid = json["pid"];
    }
    if (json["sort"] is int) {
      sort = json["sort"];
    }
    if (json["is_best"] is int) {
      isBest = json["is_best"];
    }
    if (json["go_product"] is int) {
      goProduct = json["go_product"];
    }
    if (json["production_id"] is String) {
      productionId = json["production_id"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title"] = title;
    _data["pic"] = url;
    _data["pid"] = pid;
    _data["sort"] = sort;
    _data["is_best"] = isBest;
    _data["go_product"] = goProduct;
    _data["production_id"] = productionId;
    return _data;
  }
}
