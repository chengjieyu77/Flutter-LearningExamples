/// createdAt : 1719898068
/// name : "name 1"
/// description : "Odio esse aliquid hic eos. Nulla cupiditate vitae. Recusandae quis expedita non."
/// price : 220
/// stars : 4
/// people : 5
/// selected_people : 18
/// img : "https://loremflickr.com/640/480/animals"
/// location : "Palm Springs"
/// id : "1"
library;

class PlacesModel {
  PlacesModel({
    required num createdAt,
    required String name,
    required String description,
    required num price,
    required num stars,
    required num people,
    required num selectedPeople,
    required String img,
    required String location,
    required String id,
  }) {
    _createdAt = createdAt;
    _name = name;
    _description = description;
    _price = price;
    _stars = stars;
    _people = people;
    _selectedPeople = selectedPeople;
    _img = img;
    _location = location;
    _id = id;
  }

  PlacesModel.fromJson(dynamic json) {
    _createdAt = json['createdAt'];
    _name = json['name'];
    _description = json['description'];
    _price = json['price'];
    _stars = json['stars'];
    _people = json['people'];
    _selectedPeople = json['selected_people'];
    _img = json['img'];
    _location = json['location'];
    _id = json['id'];
  }
  late num _createdAt;
  late String _name;
  late String _description;
  late num _price;
  late num _stars;
  late num _people;
  late num _selectedPeople;
  late String _img;
  late String _location;
  late String _id;
  PlacesModel copyWith({
    required num createdAt,
    required String name,
    required String description,
    required num price,
    required num stars,
    required num people,
    required num selectedPeople,
    required String img,
    required String location,
    required String id,
  }) =>
      PlacesModel(
        createdAt: createdAt ?? _createdAt,
        name: name ?? _name,
        description: description ?? _description,
        price: price ?? _price,
        stars: stars ?? _stars,
        people: people ?? _people,
        selectedPeople: selectedPeople ?? _selectedPeople,
        img: img ?? _img,
        location: location ?? _location,
        id: id ?? _id,
      );
  num get createdAt => _createdAt;
  String get name => _name;
  String get description => _description;
  num get price => _price;
  num get stars => _stars;
  num get people => _people;
  num get selectedPeople => _selectedPeople;
  String get img => _img;
  String get location => _location;
  String get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['createdAt'] = _createdAt;
    map['name'] = _name;
    map['description'] = _description;
    map['price'] = _price;
    map['stars'] = _stars;
    map['people'] = _people;
    map['selected_people'] = _selectedPeople;
    map['img'] = _img;
    map['location'] = _location;
    map['id'] = _id;
    return map;
  }
}
