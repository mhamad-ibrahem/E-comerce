import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:ecommerce/Core/classes/statusRequest.dart';
import 'package:ecommerce/Core/functions/warningAuthDialog.dart';
import 'package:ecommerce/data/DataSource/remote/Auth/loginData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Core/functions/handilingData.dart';

abstract class SignInController extends GetxController {
  GlobalKey<FormState> signinState = GlobalKey<FormState>();
  void signInvalidate();
  void remmemberMeFunction(bool val);
  void changeObscure();
  void goToForgetPassword();
  void goToSignUp();
}

class SignInImplement extends SignInController {
  bool remmemberMe = false;
  bool obscureVisability = true;
  late TextEditingController signinEmail;
  late TextEditingController signinpassword;
  StatusRequest statusRequest = StatusRequest.none;
  LoginData loginData = LoginData(Get.find());
  @override
  void signInvalidate() async {
    var formData = signinState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response =
          await loginData.postData(signinEmail.text, signinpassword.text);
      statusRequest = handilingData(response);
      print(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          // data.add(response['data']);
          Get.offAllNamed(AppRoute.loginSuccess);
        } else {
          warningAuthDialog( 'email or password is wrong');
          statusRequest = StatusRequest.faliure;
        }
      }
      update();
    } else {
      print('not valid');
    }
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
    signinEmail.clear();
    signinpassword.clear();
  }

  goToSignUp() {
    Get.toNamed(AppRoute.signUp);
    signinEmail.clear();
    signinpassword.clear();
  }

  @override
  void remmemberMeFunction(bool val) {
    remmemberMe = val;
    update();
  }

  @override
  void changeObscure() {
    obscureVisability = !obscureVisability;
    update();
  }

  @override
  void onInit() {
    signinEmail = TextEditingController();
    signinpassword = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    signinEmail.dispose();
    signinpassword.dispose();
    super.dispose();
  }
}
