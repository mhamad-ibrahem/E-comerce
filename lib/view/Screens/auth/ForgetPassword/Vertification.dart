import 'package:ecommerce/Core/classes/HandilingData.dart';
import 'package:ecommerce/controller/Auth/ForgetPassword/OtpVertificationController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Core/Constant/Colors.dart';
import '../../../../Core/Constant/ScreenSize.dart';
import '../../../../Core/Theme/Themes.dart';
import '../../../Widget/CustomButton.dart';
import '../../../Widget/PageTitle.dart';
import '../../../Widget/custom_app_bar.dart';
import '../SignUp/Custom/OTPRichText.dart';
import '../../../Widget/OTPTextFormField.dart';

class VertificationScreen extends StatelessWidget {
  const VertificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OtpVertificationPasswordImplement());
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar(context, "OTP Verification", true),
        body: GetBuilder<OtpVertificationPasswordImplement>(
          builder: (controller) => HandilingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'OTP Verification',
                    style: Themes().currentTheme.textTheme.headline4,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Number and Expire Time Text
                  OtpRichText(time: controller.times),
                  SizedBox(
                    height: AppSize.screenHight * 0.18,
                  ),
                  //OTP Text Form Fields
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OtpInput(
                        otpFunction: (String vertifaycode) {
                          print(vertifaycode);
                          controller.otpValidate(vertifaycode);
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppSize.screenHight / 6,
                  ),
                  CustomButton(
                      onTap: controller.activitButton == false
                          ? null
                          : () => controller.resendCode(),
                      buttonBody: 'Resend ',
                      buttonWidth: AppSize.screenWidth * 0.75),
                  const SizedBox(height: 80),
                  const Text('Resend OTP Code',
                      style: TextStyle(
                          color: AppColor.deepGrey,
                          fontSize: 15,
                          fontFamily: 'muli',
                          decoration: TextDecoration.underline)),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
