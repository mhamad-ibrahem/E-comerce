import 'package:ecommerce/controller/AuthController.dart';

import 'package:ecommerce/view/Widget/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Core/Constant/Colors.dart';
import '../../../Core/Theme/Themes.dart';
import '../../Widget/PageTitle.dart';
import 'AuthCustoms/SignUpCustoms/OTPRichText.dart';
import 'AuthCustoms/SignUpCustoms/OTPTextFormField.dart';

class OTPVerification extends StatelessWidget {
  OTPVerification({Key? key}) : super(key: key);
  final AuthController _authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _authController.otpState,
            child: Column(children: [
              const SizedBox(
                height: 20,
              ),
              const PageTitle(title: 'OTP Verification'),
              const SizedBox(
                height: 30,
              ),
              Text(
                'OTP Verification',
                style: Themes().currentTheme.textTheme.headline4,
              ),
              const SizedBox(
                height: 20,
              ),
              // Number and Expire Time Text
              const OtpRichText(),
              SizedBox(
                height: MediaQuery.of(context).size.height / 6,
              ),
              //OTP Text Form Fields
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  OtpInput(),
                  OtpInput(),
                  OtpInput(),
                  OtpInput(),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 6,
              ),
              CustomButton(
                  onTap: () => _authController.otpValidate(),
                  buttonBody: 'Continue',
                  buttonradius: 30,
                  containerWidth: 300),
              const SizedBox(height: 80),
              Text('Resend OTP Code',
                  style: TextStyle(
                      color: deepGrey,
                      fontSize: 15,
                      fontFamily: 'muli',
                      decoration: TextDecoration.underline)),
            ]),
          ),
        ),
      ),
    );
  }
}
