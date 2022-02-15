import 'package:drower/models/catelog.dart';
import 'package:flutter/material.dart';
import 'package:drower/models/catelog.dart';
class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item}) : assert(item!= null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          onTap: () {
            print(item.id);
          },
          leading: Image.asset(item.img),
          title: Text(item.name,textScaleFactor: 1.1,),
          subtitle: Text(item.des),
          trailing: Text("₹ ${item.price}", 
          textScaleFactor: 1.2,
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),),
        ),
    );
  }
}