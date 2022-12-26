import 'package:ecommerce/Core/classes/statusRequest.dart';
import 'package:ecommerce/data/DataSource/remote/Auth/Forget%20Password/resetpasswordData.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../Core/Constant/routes.dart';
import '../../../Core/functions/handilingData.dart';
import '../../../Core/functions/warningAuthDialog.dart';

abstract class ResetPasswordController extends GetxController {
  void goToLoginValidate();
  void changePassswordObscure();
  void changeConfirmPasswordObscure();
}

class ResetPasswordImplement extends ResetPasswordController {
  bool obscureVisability = true;
  bool confirmPasswordObscure = true;
  GlobalKey<FormState> confirmState = GlobalKey<FormState>();
  late TextEditingController password;
  late TextEditingController confirmPassword;
  String? email;
  StatusRequest statusRequest = StatusRequest.none;
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  @override
  void goToLoginValidate() async {
    var formData = confirmState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.postData(email!, password.text);
      statusRequest = handilingData(response);
      print(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          Get.offAllNamed(AppRoute.signIn);
        } else {
          warningAuthDialog('email or password is wrong');
          statusRequest = StatusRequest.faliure;
        }
      } else {
        print('not valid');
      }
    }
  }

  @override
  void onInit() {
    password = TextEditingController();
    confirmPassword = TextEditingController();
    email = Get.arguments["email"];
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  void changeConfirmPasswordObscure() {
    confirmPasswordObscure = !confirmPasswordObscure;
    update();
  }

  @override
  void changePassswordObscure() {
    obscureVisability = !obscureVisability;
    update();
  }
}
