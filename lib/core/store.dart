// ignore: import_of_legacy_library_into_null_safe
import 'package:velocity_x/velocity_x.dart';

import 'package:drower/models/cart.dart';
import 'package:drower/models/catelog.dart';

class MyStore extends VxStore {
  late CatalogModel catalog;
  late CartModel cart;
  MyStore(){
    catalog = CatalogModel();
    cart = CartModel();

    cart.catalog = catalog;
  }

  
  
}
