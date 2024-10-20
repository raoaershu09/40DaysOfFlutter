import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:velocity_x/velocity_x.dart';

class MyTheme{
  static ThemeData get lightTheme => ThemeData(
    primarySwatch: Colors.deepPurple,
    fontFamily: GoogleFonts.poppins().fontFamily,
    //  cardColor: Colors.white,
    //   canvasColor: darkCreamColor,
    //   buttonTheme: ButtonThemeData(
    //     buttonColor: darkBluishColor,
    //   ),
    appBarTheme: const AppBarTheme(
    color: Colors.white,
    elevation: 0.0,
    iconTheme: IconThemeData(color: Colors.black),
      ),
      );
      
      static ThemeData get darkTheme => ThemeData(
      brightness: Brightness.dark
      // fontFamily: GoogleFonts.poppins().fontFamily,
      // cardColor: Colors.black,
      // canvasColor: darkCreamColor,
      // appBarTheme: const AppBarTheme(
      // color: Colors.black,
      // elevation: 0.0,
      // iconTheme: IconThemeData(color: Colors.white),
      // ),
      // buttonTheme: ButtonThemeData(
      //   buttonColor: lightBluishColor,
      // ),
      // colorScheme: ColorScheme.light().copyWith(
      //   secondary: Colors.white
      // ),
      
    );

      static Color creamColor = const Color(0xfff5f5f5);
      static Color darkCreamColor = Vx.gray900;
       static Color darkBluishColor = const Color(0xff403b58);
         static Color lightBluishColor = Vx.indigo500;
      
}