import 'package:ecommerce/model/Themes.dart';
import 'package:ecommerce/view/CutomWidgets/CustomButton.dart';
import 'package:ecommerce/view/Home/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../MainPage.dart';
import '../../controller/HomePageController.dart';

class LoginSuccess extends StatelessWidget {
  const LoginSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Login Success',
                style: Themes().currentTheme.textTheme.headline3,
              ),
              const SizedBox(),
              SizedBox(child: Image.asset('assets/images/success.png')),
              Text(
                'Login Success',
                style: Themes().currentTheme.textTheme.headline4,
              ),
              CustomButton(
                onTap: () => Get.offAll(MainPage()),
                buttonBody: 'Back to home',
                buttonradius: 30,
                containerWidth: 220,
              )
            ],
          ),
        ),
      ),
    );
  }
}
