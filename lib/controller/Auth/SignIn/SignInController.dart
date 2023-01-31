import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:ecommerce/Core/classes/statusRequest.dart';
import 'package:ecommerce/Core/functions/checkInternetConnection.dart';
import 'package:ecommerce/Core/functions/warningAuthDialog.dart';
import 'package:ecommerce/Core/services/Services.dart';
import 'package:ecommerce/data/DataSource/remote/Auth/loginData.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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
  Services services = Get.find();
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
          if (response['data']["user_approve"] == "1") {
            services.box.put("username", response['data']['user_name']);
            services.box.put("email", response['data']['user_email']);
            services.box.put("phone", response['data']['user_number']);
            services.box.put("location", response['data']['user_location']);
            services.box.put("id", response['data']['user_id']);
            services.box.put("step", "2");
            Get.offAllNamed(AppRoute.loginSuccess);
          } else {
            Get.toNamed(AppRoute.signUpOtp,
                arguments: {"email": signinEmail.text});
          }
        } else {
          warningAuthDialog('email or password is wrong');
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

  // getTokenMessage() async {
  //   if (await checkInternet()) {
  //     FirebaseMessaging.instance.getToken().then((value) {
  //       print(value);
  //       String? token = value;
  //     FirebaseMessaging.onMessage.listen((event) {
  //       // Get.snackbar("${event.notification}", "");
  //       print("${event.notification}");
  //     });
  //     });
  //   }
  // }

  initialMessage() async {
    //work when app is closed
    var message = await FirebaseMessaging.instance.getInitialMessage();
    if (message != null) {
      Get.toNamed(AppRoute.signUp);
    }
  }

  @override
  void onInit() {
    initialMessage();
    FirebaseMessaging.instance.getToken().then((value) {
      //work when app is background state
      print(value);
      String? token = value;
      FirebaseMessaging.onMessageOpenedApp.listen((event) {
        Get.toNamed(AppRoute.signUp);
      });
      FirebaseMessaging.onMessage.listen((event) {
        //work when app is open
        Get.snackbar(
            "${event.notification!.title}", "${event.notification!.body}");
        print("${event.notification}");
      });
    });
    signinEmail = TextEditingController();
    signinpassword = TextEditingController();

    super.onInit();
  }

  @override
  void onClose() {
    services.box.close();
    super.onClose();
  }

  @override
  void dispose() {
    signinEmail.dispose();
    signinpassword.dispose();
    super.dispose();
  }
}
