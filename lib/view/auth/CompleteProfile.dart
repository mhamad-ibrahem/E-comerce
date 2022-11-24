import 'package:ecommerce/Constant/Colors.dart';
import 'package:ecommerce/controller/AuthController.dart';
import 'package:ecommerce/model/Themes.dart';
import 'package:ecommerce/view/CutomWidgets/CustomButton.dart';
import 'package:ecommerce/view/auth/AuthCustoms/SignUpCustoms/TermsAndConditions.dart';
import 'package:ecommerce/view/auth/OTPVerification.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../CutomWidgets/CustomTextFormField.dart';
import '../CutomWidgets/PageTitle.dart';
import 'AuthCustoms/SignUpCustoms/CompleteProfileTextFields.dart';

class CompleteProfile extends StatelessWidget {
  CompleteProfile({Key? key}) : super(key: key);
  final AuthController _authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _authController.completeState,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const PageTitle(
                  title: 'Sign Up',
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Complete Profile',
                  style: Themes().currentTheme.textTheme.headline4,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Complete your details or continue\nwith social media',
                  textAlign: TextAlign.center,
                  style: Themes().currentTheme.textTheme.headline1,
                ),
                const SizedBox(
                  height: 30,
                ),
                CompleteProfileTextFields(authController: _authController),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  onTap: () => _authController.completevalidate(),
                  buttonBody: 'Continue',
                  buttonradius: 35,
                  containerWidth: 300,
                ),
                const SizedBox(
                  height: 30,
                ),
                TermsAndConditions()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
