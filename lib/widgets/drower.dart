import 'package:flutter/material.dart';

class MyDrower extends StatelessWidget {
  const MyDrower({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  currentAccountPicture: CircleAvatar(backgroundImage: AssetImage("assets/images/hsc.jpeg"),),
                  accountName: Text("Hs Chaudhary"),
                  accountEmail: Text("hschaudhary06@gmail.com",
                  )
                )
              )
        ],
      ),
    );
  }
}
