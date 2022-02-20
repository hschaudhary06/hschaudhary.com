import 'package:drower/models/catelog.dart';

class CartModel {
  static final cartModel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartModel;

  CatalogModel _catalog = CatalogModel();
 
  final List<int> _itemIDs = [];

  // get catalog
  CatalogModel get catalog => _catalog;

  // set catalog
  set catalog(CatalogModel newCatalog){
    _catalog = newCatalog;
  }

  //get item in the cart
  List<Item> get items => _itemIDs.map((id) => _catalog.getById(id)).toList();

  // get total item price
  num get totalPrice => items.fold(0, (total, current) => total + current.price);

  // add item
  void add(Item item){
    _itemIDs.add(item.id);
  }

  //remove item
  void remove(Item item){
    _itemIDs.remove(item.id);
  }
}
