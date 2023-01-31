import 'package:ecommerce/Core/classes/HandilingData.dart';
import 'package:ecommerce/controller/Auth/SignUp/vertificationController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Core/Constant/Colors.dart';
import '../../../../Core/Constant/ScreenSize.dart';
import '../../../Widget/CustomButton.dart';
import '../../../Widget/PageTitle.dart';
import '../../../Widget/OTPTextFormField.dart';
import 'Custom/OTPRichText.dart';

class OTPVerification extends StatelessWidget {
  OTPVerification({Key? key}) : super(key: key);
  final VertificationImplement controller = Get.put(VertificationImplement());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: GetBuilder<VertificationImplement>(
        builder: ((controller) => HandilingDataRequest(
            statusRequest: controller.statusRequest,
            widget: WillPopScope(
              onWillPop: () => controller.onExit(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const PageTitle(
                      title: 'OTP Verification',
                      backArrowVisiablity: false,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'OTP Verification',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                     OtpRichText(time: controller.times),
                    // Number and Expire Time Text
                    // OtpRichText(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 6,
                    ),
                    //OTP Text Form Fields
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OtpInput(otpFunction: (String vertifaycode) {
                          print(vertifaycode);
                          controller.otpValidate(vertifaycode);
                        }),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 6,
                    ),
                    CustomButton(
                      onTap:controller.activitButton == false ?null :()=>controller.resendCode(),
                      buttonBody: 'Resend',
                      buttonWidth: AppSize.screenWidth * 0.75
                    ),
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
            ))),
      )),
    );
  }
}
