import 'package:ecommerce/Constant/Colors.dart';
import 'package:flutter/material.dart';

class Themes {
  ThemeData currentTheme = Themes.lightsTheme;
  static ThemeData darksTheme =
      ThemeData.dark().copyWith(appBarTheme: AppBarTheme(color: Colors.white));
  static ThemeData lightsTheme = ThemeData.light().copyWith(
      scaffoldBackgroundColor: backColorLight,
      textTheme: TextTheme(
          headline1: TextStyle(
              color: deepGrey,
              fontSize: 15,
              fontFamily: 'muli',
              fontWeight: FontWeight.w600),
          headline2: TextStyle(
              color: deepGrey,
              fontSize: 13,
              fontFamily: 'muli',
              fontWeight: FontWeight.w600),
          headline3: TextStyle(
              color: deepGrey,
              fontSize: 20,
              fontFamily: 'muli',
              fontWeight: FontWeight.w800),
          headline4: TextStyle(
              color: black,
              fontSize: 30,
              fontFamily: 'muli',
              fontWeight: FontWeight.bold),
          headline5: TextStyle(
              color: white,
              fontSize: 17,
              fontFamily: 'muli',
              fontWeight: FontWeight.w900),
          headline6: TextStyle(
              color: grey,
              fontSize: 15,
              fontFamily: 'muli',
              fontWeight: FontWeight.w600),
          caption: TextStyle(
              color: orange,
              fontSize: 15,
              fontFamily: 'muli',
              fontWeight: FontWeight.bold)));
}
