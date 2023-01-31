import 'package:ecommerce/Core/Constant/Colors.dart';
import 'package:flutter/material.dart';

class Themes {
  ThemeData currentTheme = Themes.lightsTheme;
  static ThemeData darksTheme =
      ThemeData.dark().copyWith(appBarTheme: const AppBarTheme(color: Colors.white));
  static ThemeData lightsTheme = ThemeData.light().copyWith(
      scaffoldBackgroundColor:AppColor. backColorLight,
      textTheme: const TextTheme(
          headline1: TextStyle(
              color: AppColor.deepGrey,
              fontSize: 15,
              fontFamily: 'muli',
              fontWeight: FontWeight.w600),
          headline2: TextStyle(
              color:AppColor. deepGrey,
              fontSize: 13,
              fontFamily: 'muli',
              fontWeight: FontWeight.w600),
          headline3: TextStyle(
              color:AppColor. deepGrey,
              fontSize: 20,
              fontFamily: 'muli',
              fontWeight: FontWeight.bold),
          headline4: TextStyle(
              color:AppColor. black,
              fontSize: 30,
              fontFamily: 'muli',
              fontWeight: FontWeight.bold),
          headline5: TextStyle(
              color:AppColor. white,
              fontSize: 17,
              fontFamily: 'muli',
              fontWeight: FontWeight.w900),
          headline6: TextStyle(
              color: AppColor.grey,
              fontSize: 15,
              fontFamily: 'muli',
              fontWeight: FontWeight.w600),
          caption: TextStyle(
              color: AppColor.orange,
              fontSize: 15,
              fontFamily: 'muli',
              fontWeight: FontWeight.bold)));
}
