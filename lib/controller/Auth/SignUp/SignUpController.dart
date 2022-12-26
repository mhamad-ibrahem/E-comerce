import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:ecommerce/Core/functions/warningAuthDialog.dart';
import 'package:ecommerce/data/DataSource/remote/Auth/signupData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Core/classes/statusRequest.dart';
import '../../../Core/functions/handilingData.dart';

abstract class SignUpController extends GetxController {
  void signUpvalidate();
  void completevalidate();
  void changeObscurePassword();
  void changeObscureConfirmPassword();
}

class SignUpImplement extends SignUpController {
  late TextEditingController signUpEmail;
  late TextEditingController signUppassword;
  late TextEditingController signUppasswordConfirm;
  late TextEditingController name;
  late TextEditingController phoneNumber;
  late TextEditingController address;
  GlobalKey<FormState> completeState = GlobalKey<FormState>();
  GlobalKey<FormState> signUpState = GlobalKey<FormState>();
  bool passwordObscure = true;
  bool confirmPasswordObscure = true;
  StatusRequest statusRequest = StatusRequest.none;
  SignupData signupData = SignupData(Get.find());
  List data = [];
  @override
  void signUpvalidate() {
    var formData = signUpState.currentState;
    if (formData!.validate()) {
      Get.toNamed(AppRoute.signUpValidate);
    }
  }

  @override
  void completevalidate() async {
    var formData = completeState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupData.postData(name.text, signUpEmail.text,
          signUppassword.text, phoneNumber.text, address.text);
      statusRequest = handilingData(response);
      print(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          // data.add(response['data']);
          Get.offAllNamed(AppRoute.signUpOtp,
              arguments: {"email": signUpEmail.text});
        } else {
          warningAuthDialog('email or phone number already exsist' );
          statusRequest = StatusRequest.faliure;
        }
      }
      update();
    }
  }

  @override
  void changeObscureConfirmPassword() {
    confirmPasswordObscure = !confirmPasswordObscure;
    update();
  }

  @override
  void changeObscurePassword() {
    passwordObscure = !passwordObscure;
    update();
  }

  @override
  void onInit() {
    signUpEmail = TextEditingController();
    signUppassword = TextEditingController();
    signUppasswordConfirm = TextEditingController();
    name = TextEditingController();
    phoneNumber = TextEditingController();
    address = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    signUpEmail.dispose();
    signUppassword.dispose();
    signUppasswordConfirm.dispose();
    name.dispose();
    phoneNumber.dispose();
    address.dispose();
    super.onClose();
  }
}
