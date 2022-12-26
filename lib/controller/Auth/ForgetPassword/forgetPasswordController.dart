import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:ecommerce/Core/classes/statusRequest.dart';
import 'package:ecommerce/data/DataSource/remote/Auth/Forget%20Password/checkemailData.dart';
import 'package:get/get.dart';
import'package:flutter/material.dart';

import '../../../Core/functions/handilingData.dart';
import '../../../Core/functions/warningAuthDialog.dart';

abstract class ForgetPasswordController extends GetxController {

void forgotPassvalidate();
}

class ForgetPasswordImplement extends ForgetPasswordController {

  late TextEditingController forgotPasswordemail ;
  GlobalKey<FormState> forgotPassState = GlobalKey<FormState>();
  StatusRequest statusRequest =StatusRequest.none ;
  CheckemailData checkemailData = CheckemailData(Get.find());
  @override

  void forgotPassvalidate() async{
    var formData = forgotPassState.currentState;
    if (formData!.validate()) {
        statusRequest = StatusRequest.loading;
      update();
      var response =
          await checkemailData.postData(forgotPasswordemail.text);
      statusRequest = handilingData(response);
      print(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
     
         Get.offNamed(AppRoute.verificationPage , arguments:  {
          "email" : forgotPasswordemail.text
         });
        } else {
          warningAuthDialog( 'email not found');
          statusRequest = StatusRequest.faliure;
        }
      }
      update();
      
    }
  }
  @override
  void onInit() {
    forgotPasswordemail = TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    forgotPasswordemail.dispose();
    super.dispose();
  }
}