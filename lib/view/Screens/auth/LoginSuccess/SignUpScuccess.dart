import 'package:ecommerce/view/Screens/auth/LoginSuccess/CustomScuccess.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Core/Constant/routes.dart';

class SignUpSuccess extends StatelessWidget {
  const SignUpSuccess ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomSuccess(
      textSuccess: 'Creating Account Success',
      buttonText: 'back to home',
      function:()=> Get.offAllNamed(AppRoute.mainPage),
    );
  }
}
