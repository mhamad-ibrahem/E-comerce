import 'package:ecommerce/Constant/Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/Themes.dart';
import '../SignUp.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Don\'t have an account?',
            style: TextStyle(
              color: deepGrey,
              fontSize: 15,
              fontFamily: 'muli',
            )),
        TextButton(
          onPressed: () => Get.to(() => SignUp()),
          child:
              Text('Sign Up', style: Themes().currentTheme.textTheme.caption),
        ),
      ],
    );
  }
}
