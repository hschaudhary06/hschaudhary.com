import 'package:drower/models/cart.dart';
import 'package:drower/models/catelog.dart';
import 'package:drower/widgets/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatefulWidget {
  final Item catalog;
  const AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);
  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart=_cart.items.contains(widget.catalog);
    return ElevatedButton(
      onPressed: () {
        if(!isInCart){
          isInCart = isInCart.toggle();
          final _catalog = CatalogModel();
          _cart.add(widget.catalog);
          setState(() { });
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