import 'package:ecommerce/model/Themes.dart';
import 'package:ecommerce/view/OnBoarding/onBoardingPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const Ecommerce());
}

class Ecommerce extends StatelessWidget {
  const Ecommerce({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes().currentTheme,
      initialRoute: 'onBoarding',
      routes: {'onBoarding': (p0) => OnBorading()},
    );
  }
}
