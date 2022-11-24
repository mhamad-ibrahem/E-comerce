import 'package:ecommerce/view/Home/HomePage.dart';
import 'package:ecommerce/view/auth/CompleteProfile.dart';
import 'package:ecommerce/view/auth/LoginSuccess.dart';
import 'package:ecommerce/view/auth/OTPVerification.dart';
import 'package:ecommerce/view/auth/SignIn.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../MainPage.dart';

class AuthController extends GetxController {
  //Sign in
  bool remmemberMe = false;
  GlobalKey<FormState> signinState = GlobalKey<FormState>();
  TextEditingController signinEmail = TextEditingController();
  TextEditingController signinpassword = TextEditingController();

  void signInvalidate() {
    var formData = signinState.currentState;
    if (formData!.validate()) {
      Get.to(() => LoginSuccess());
    }
  }

  void remmemberMeFunction(bool val) {
    remmemberMe = val;
    update();
  }

  //Forgot Password
  TextEditingController forgotPasswordemail = TextEditingController();
  GlobalKey<FormState> forgotPassState = GlobalKey<FormState>();
  void forgotPassvalidate() {
    var formData = forgotPassState.currentState;
    if (formData!.validate()) {
      Get.back();
    }
  }

  //Sign Up
  TextEditingController signUpEmail = TextEditingController();
  TextEditingController signUppassword = TextEditingController();
  TextEditingController signUppasswordConfirm = TextEditingController();
  GlobalKey<FormState> signUpState = GlobalKey<FormState>();
  void signUpvalidate() {
    var formData = signUpState.currentState;
    if (formData!.validate()) {
      Get.to(() => CompleteProfile());
    }
  }

  // Complete Profile

  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController address = TextEditingController();
  GlobalKey<FormState> completeState = GlobalKey<FormState>();
  void completevalidate() {
    var formData = completeState.currentState;
    if (formData!.validate()) {
      Get.to(() => OTPVerification());
    }
  }

  //OTP Verification

  TextEditingController otpNum = TextEditingController();
  GlobalKey<FormState> otpState = GlobalKey<FormState>();
  void otpValidate() {
    var formData = otpState.currentState;
    if (formData!.validate()) {
      Get.offAll(() => MainPage());
    }
  }
}
