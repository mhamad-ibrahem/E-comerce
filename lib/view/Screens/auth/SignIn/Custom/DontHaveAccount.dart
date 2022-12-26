import 'package:ecommerce/Core/Constant/Colors.dart';
import 'package:ecommerce/controller/Auth/SignIn/SignInController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DontHaveAccount extends GetView<SignInImplement> {
  const DontHaveAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Don\'t have an account?',
            style: TextStyle(
              color: AppColor.deepGrey,
              fontSize: 15,
              fontFamily: 'muli',
            )),
        TextButton(
          onPressed: () {
            controller.goToSignUp();
          },
          child: const Text(
            'SignUp',
            style: TextStyle(
                color: AppColor.deepOrange,
                fontSize: 15,
                fontFamily: 'muli',
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }
}
