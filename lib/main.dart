import 'dart:convert';

import 'package:drower/cart_page.dart';
import 'package:drower/models/catelog.dart';
import 'package:drower/routes/MyRoutes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
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
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme(context),
      darkTheme: AppTheme.darkTheme(context),
      initialRoute: MyRoutes.home,
      routes: {
        MyRoutes.login : (context) => Login(),
        MyRoutes.home : (context) => HomePage(),
        MyRoutes.cart : (context) => CartPage(),
      },
    );
  }
}
