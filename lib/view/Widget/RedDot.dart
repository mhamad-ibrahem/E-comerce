import 'package:ecommerce/Core/Theme/Themes.dart';
import 'package:flutter/material.dart';

import '../../Core/Constant/Colors.dart';

Widget redDot() {
  return Positioned(
    left: 35,
    top: 5,
    child: Container(
      decoration: new BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(7),
      ),
      constraints: BoxConstraints(
        minWidth: 15,
        minHeight: 14,
      ),
      child: Container(
        width: 3,
        height: 3,
        child: Text(
          '3',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900),
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );
}
