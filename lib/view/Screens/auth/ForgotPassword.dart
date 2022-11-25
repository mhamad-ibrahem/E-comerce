import 'package:ecommerce/controller/AuthController.dart';
import 'package:ecommerce/view/Widget/CustomButton.dart';
import 'package:ecommerce/view/Widget/CustomTextFormField.dart';
import 'package:ecommerce/view/Screens/auth/AuthCustoms/DontHaveAccount.dart';
import 'package:ecommerce/view/Screens/auth/SignIn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Core/Constant/Colors.dart';
import '../../../Core/Theme/Themes.dart';
import '../../Widget/PageTitle.dart';
import 'SignUp.dart';

class ForgotPassword extends StatelessWidget {
  final AuthController _authController = Get.find();
  ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const PageTitle(title: 'Forgot Password'),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Forgot Password',
                style: Themes().currentTheme.textTheme.headline4,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Please enter your email and we will send\nyou a link to return to your account',
                textAlign: TextAlign.center,
                style: Themes().currentTheme.textTheme.headline1,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 6,
              ),
              Form(
                key: _authController.forgotPassState,
                child: CustomTextFormField(
                  icon: Icons.email_outlined,
                  label: 'Email',
                  hint: 'Enter your email',
                  inputType: TextInputType.emailAddress,
                  obscure: false,
                  errorVal: 'Email',
                  vallengthError: 10,
                  valreturn: 'Email can\'t be less than 10 characters',
                  textEditingController: _authController.forgotPasswordemail,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 6,
              ),
              CustomButton(
                  onTap: () {
                    _authController.forgotPassvalidate();
                  },
                  buttonBody: 'Continue',
                  buttonradius: 30,
                  containerWidth: 300),
              const SizedBox(height: 60),
              const DontHaveAccount()
            ],
          ),
        ),
      ),
    );
  }
}
