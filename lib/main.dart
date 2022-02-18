import 'dart:convert';

import 'package:drower/routes/MyRoutes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'home.dart';
import 'login.dart';
import 'widgets/theme.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    var response = await http.get(
            Uri.http(
              "hschaudhary.epizy.com",
              "api/api.php"
            ),
            headers:{"action":"getdata"}
          );
    var json = jsonDecode(response.body);
    
    List<User> users = [];

    for(var u in json ){
     User user = User(u["id"],u["username"],u["password"]);
     users.add(user);
    }

    print(users.length);
    return users;
    // var Json = await rootBundle.loadString("assets/files/catelog.json");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme(context),
      darkTheme: AppTheme.darkTheme(context),
      initialRoute: MyRoutes.home,
      routes: {
        MyRoutes.login : (context) => Login(),
        MyRoutes.home : (context) => HomePage(),
      },
    );
  }
}

class User{
  final String id,username,password;

  User(this.id, this.username, this.password);
}
