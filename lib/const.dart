import 'package:flutter/material.dart';

class Consts {
  // double defultPadding = 20;

  // int titleFontSize = 30;

  static Color mainPurple = const Color.fromARGB(255, 80, 0, 94);
  static ThemeData taskCartTransparentTheme = ThemeData(
    canvasColor: Colors.transparent,
    shadowColor: Colors.transparent,
    dialogBackgroundColor: Colors.transparent,
  );

  static TextStyle titleTextStyle = const TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold, fontFamily: "Poppins");

  static TextStyle cardTextStyle = const TextStyle(
      fontSize: 20, fontWeight: FontWeight.normal, fontFamily: "Poppins");
}
