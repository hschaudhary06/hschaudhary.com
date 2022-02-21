import 'package:drower/core/store.dart';
import 'package:drower/models/cart.dart';
import 'package:drower/models/catelog.dart';
import 'package:drower/widgets/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    VxState.listen(context,to: [AddMutation]);

    final CartModel _cart = (VxState.store as MyStore).cart;

    bool isInCart=_cart.items.contains(catalog);
    return ElevatedButton(
      onPressed: () {
        if(!isInCart){
          AddMutation(catalog);
          
        }
      }, 
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          AppTheme.darkBluishColor,
        ),
        shape: MaterialStateProperty.all(StadiumBorder()),
      ),
      child: isInCart?Icon(Icons.done):Icon(CupertinoIcons.cart_badge_plus));
  }
}