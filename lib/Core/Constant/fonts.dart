
import 'package:flutter/material.dart';
import 'Colors.dart';

//Colors Functions
TextStyle blackTextStyle() {
  return const TextStyle(
      color:AppColor. black,
      fontSize: 18,
      fontFamily: 'muli',
      fontWeight: FontWeight.w600);
}

TextStyle biggerBlackTextStyle() {
  return const TextStyle(
      color: AppColor.black,
      fontSize: 25,
      fontFamily: 'muli',
      fontWeight: FontWeight.w600);
}

TextStyle smallerBlackTextStyle() {
  return const TextStyle(
      color: AppColor.black,
      fontSize: 12,
      fontFamily: 'muli',
      fontWeight: FontWeight.w900);
}

TextStyle smallGreyTextStyle() {
  return const TextStyle(
    color: AppColor.grey,
    fontSize: 13,
    fontFamily: 'muli',
  );
}
