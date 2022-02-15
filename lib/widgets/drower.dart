import 'package:drower/routes/MyRoutes.dart';
import 'package:flutter/cupertino.dart';
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
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/hsc.jpg"),
              ),
              accountName: Text("Hs Chaudhary"),
              accountEmail: Text("hschaudhary06@gmail.com"),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.home);
            },
            leading: Icon(
              CupertinoIcons.home,
              // color: Colors.black,
            ),
            title: Text(
              "Home",
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.question_circle,
              // color: Colors.black,
            ),
            title: Text(
              "About",
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.mail,
              // color: Colors.black,
            ),
            title: Text(
              "Email",
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.login);
            },
            leading: Icon(
              CupertinoIcons.square_arrow_left,
              // color: Colors.black,
            ),
            title: Text(
              "Log out",
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600)
            ),
          )
        ],
      ),
    );
  }
}
