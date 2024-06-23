class ShopModel {
  String? id;
  String? title;
  int? status;
  String? url;

  ShopModel({this.id, this.title, this.status, this.url});

  ShopModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    status = json['status'];
    url = json['url'];
  }

  factory ShopModel.fromJson2(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': String id,
        'title': String title,
        'status': int status,
        'url': String url,
      } =>
        ShopModel(id: id, title: title, status: status, url: url),
      _ => throw const FormatException('Failed to load data.'),
    };
  }
}
