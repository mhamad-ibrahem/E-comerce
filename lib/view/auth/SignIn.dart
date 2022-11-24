import 'package:ecommerce/controller/AuthController.dart';
import 'package:ecommerce/model/Themes.dart';
import 'package:ecommerce/view/CutomWidgets/CustomButton.dart';
import 'package:ecommerce/view/auth/AuthCustoms/FaceGoogleTwitterAuth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../CutomWidgets/PageTitle.dart';
import 'AuthCustoms/DontHaveAccount.dart';
import 'AuthCustoms/SignInCustoms/ForgotPasswordRow.dart';
import 'AuthCustoms/SignInCustoms/SignInTextFormFields.dart';
import 'AuthCustoms/SignInCustoms/SignInTextFormFields.dart';

class SignIn extends StatelessWidget {
  final AuthController _authController = Get.put(AuthController());
  SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _authController.signinState,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const PageTitle(title: 'Sign In'),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Welcom Back',
                  style: Themes().currentTheme.textTheme.headline4,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Sign in with email and password\nor continue with social media',
                  textAlign: TextAlign.center,
                  style: Themes().currentTheme.textTheme.headline1,
                ),
                const SizedBox(
                  height: 60,
                ),
                // The Text Form Field For Sign In Page
                SignInTextFormFields(authController: _authController),
                const SizedBox(
                  height: 15,
                ),
                // Forgot password and Remmember me Row
                ForgotPasswordRow(authController: _authController),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  onTap: () => _authController.signInvalidate(),
                  buttonBody: 'Continue',
                  buttonradius: 25,
                  containerWidth: 300,
                ),
                const SizedBox(
                  height: 50,
                ),
                // FaceBook Goggle Twitter Logos
                const FaceGoogleTwitterAuth(),
                const SizedBox(
                  height: 20,
                ),
                // Don't Have an Acount TextButton
                const DontHaveAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
