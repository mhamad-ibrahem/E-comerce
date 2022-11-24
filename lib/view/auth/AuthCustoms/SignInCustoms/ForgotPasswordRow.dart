import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Constant/Colors.dart';
import '../../../../controller/AuthController.dart';
import '../../../../model/Themes.dart';
import '../../ForgotPassword.dart';

class ForgotPasswordRow extends StatelessWidget {
  const ForgotPasswordRow({
    Key? key,
    required AuthController authController,
  })  : _authController = authController,
        super(key: key);

  final AuthController _authController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            GetBuilder<AuthController>(
              builder: (controller) => Checkbox(
                  activeColor: orange,
                  value: _authController.remmemberMe,
                  onChanged: (val) {
                    _authController.remmemberMeFunction(val!);
                  }),
            ),
            Text(
              'Remember me',
              style: Themes().currentTheme.textTheme.headline2,
            ),
          ],
        ),
        TextButton(
            onPressed: () {
              Get.to(() => ForgotPassword());
            },
            child: Text(
              'Forgot Password',
              style: TextStyle(
                  color: deepGrey,
                  fontSize: 13,
                  fontFamily: 'muli',
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline),
            ))
      ],
    );
  }
}
