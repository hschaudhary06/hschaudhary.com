import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class AppTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
        // appBarTheme: AppBarTheme(
        //   color: Colors.white,
        //   elevation: 0.0,
        //   titleTextStyle : TextStyle(color: Colors.black),
        //   iconTheme: IconThemeData(color: Colors.black)
        // ),
      );
  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
      );
  
}