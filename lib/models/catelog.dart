class CatelogModal {
  static List<Item> Items = [];
}

class Item {
  final int id;
  final String name;
  final String des;
  final num price;
  final String color;
  final String img;

  Item(
      {this.id=0,
      this.name = 'null',
      this.des = 'null',
      this.price = 0,
      this.color = 'null',
      this.img = 'null'});

  factory Item.fromMap(Map<String,dynamic> map){
    return Item(
      id: map["id"],
      name: map["name"],
      des: map["des"],
      price: map["price"],
      color: map["color"],
      img: map["img"],
    );
  }

  toMap() => {
      "id": id,
      "name": name,
      "des": des,
      "price": price,
      "color":color,
      "img": img
  };
}
