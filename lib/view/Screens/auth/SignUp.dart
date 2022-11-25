import 'package:ecommerce/Core/Constant/Colors.dart';
import 'package:ecommerce/controller/AuthController.dart';
import 'package:ecommerce/Core/Theme/Themes.dart';
import 'package:ecommerce/view/Widget/CustomButton.dart';
import 'package:ecommerce/view/Screens/auth/CompleteProfile.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../Widget/CustomTextFormField.dart';
import '../../Widget/PageTitle.dart';
import 'AuthCustoms/SignUpCustoms/ConfirmPasswordForm.dart';
import 'AuthCustoms/FaceGoogleTwitterAuth.dart';
import 'AuthCustoms/SignUpCustoms/RegesterationTextFormFieldes.dart';
import 'AuthCustoms/SignUpCustoms/TermsAndConditions.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  final AuthController _authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _authController.signUpState,
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
                  'Register Account',
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
                  height: 40,
                ),
                // The Text Form Field For Sign up Page
                RegesterationTextFormFieldes(authController: _authController),
                const SizedBox(
                  height: 40,
                ),
                CustomButton(
                  onTap: () => _authController.signUpvalidate(),
                  buttonBody: 'Continue',
                  buttonradius: 35,
                  containerWidth: 300,
                ),
                const SizedBox(
                  height: 40,
                ),
                // FaceBook Goggle Twitter Logos
                const FaceGoogleTwitterAuth(),
                const SizedBox(
                  height: 20,
                ),
                // The Terms and Conditions Text
                const TermsAndConditions()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
