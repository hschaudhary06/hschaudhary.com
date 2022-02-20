import 'package:drower/models/cart.dart';
import 'package:drower/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
class CartPage extends StatelessWidget {
  const CartPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.creamColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.xl2.bold.color(AppTheme.darkBluishColor).make(),
      ),

      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
      
    );
  }
}

class _CartTotal extends StatelessWidget {

  const _CartTotal({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return SizedBox(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalPrice}".text.xl4.color(AppTheme.darkBluishColor).make(),
          30.widthBox,
          ElevatedButton(
            onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "Buying not supported yet".text.make()));
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(AppTheme.darkBluishColor),
            ),
            child: "Buy".text.make()
          ).w32(context)

        ],
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  const _CartList({ Key? key }) : super(key: key);

  @override
  State<_CartList> createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _cart.items.length,
      itemBuilder: (context,index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
        title: _cart.items[index].name.text.make(),
      ),
      
    );
  }
}