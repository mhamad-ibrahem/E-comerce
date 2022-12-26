import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:ecommerce/controller/Auth/SignIn/SignInController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Core/Constant/Colors.dart';

class ForgotPasswordRow extends StatelessWidget {
  const ForgotPasswordRow({
    super.key,
  });

  @override
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInImplement>(
      builder: (controller) =>
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Row(
          children: [
            Checkbox(
                activeColor: AppColor.orange,
                value: controller.remmemberMe,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                onChanged: (val) {
                  controller.remmemberMeFunction(val!);
                }),
            Text(
              'Remember me',
              style: Theme.of(context).textTheme.headline2,
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            controller.goToForgetPassword();
          },
          child: const Text(
            'Forgot Password',
            style: TextStyle(
                color: AppColor.deepOrange,
                fontSize: 13,
                fontFamily: 'muli',
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline),
          ),
        ),
      ]),
    );
  }
}
