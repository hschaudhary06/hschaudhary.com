import 'package:drower/core/store.dart';
import 'package:drower/models/catelog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
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

  //remove item
  void remove(Item item){
    _itemIDs.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store.cart._itemIDs.add(item.id);
  }

}
