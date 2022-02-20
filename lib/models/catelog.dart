import 'dart:convert';

class CatalogModel {
  static final catModel = CatalogModel._internal();

  CatalogModel._internal();

  factory CatalogModel() => catModel;

  static List<Item> Items = [];

  // get item by ID
  Item getById(int id) => Items.firstWhere((element) => element.id == id, orElse: null);

  // get item By position
  Item getByPosition(int pos) => Items[pos];
}

class Item {
  final int id;
  final String name;
  final String des;
  final num price;
  final String color;
  final String img;

  Item(
    this.id,
    this.name,
    this.des,
    this.price,
    this.color,
    this.img
  );

  

  Item copyWith({
    int? id,
    String? name,
    String? des,
    num? price,
    String? color,
    String? img,
  }) {
    return Item(
      id ?? this.id,
      name ?? this.name,
      des ?? this.des,
      price ?? this.price,
      color ?? this.color,
      img ?? this.img,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'des': des,
      'price': price,
      'color': color,
      'img': img,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      map['id']?.toInt() ?? 0,
      map['name'] ?? '',
      map['des'] ?? '',
      map['price'] ?? 0,
      map['color'] ?? '',
      map['img'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Item(id: $id, name: $name, des: $des, price: $price, color: $color, img: $img)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Item &&
      other.id == id &&
      other.name == name &&
      other.des == des &&
      other.price == price &&
      other.color == color &&
      other.img == img;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      des.hashCode ^
      price.hashCode ^
      color.hashCode ^
      img.hashCode;
  }
}
