import 'package:ecommerce/Core/classes/HandilingData.dart';
import 'package:ecommerce/controller/Auth/ForgetPassword/OtpVertificationController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Core/Constant/ScreenSize.dart';
import '../../../../Core/Theme/Themes.dart';
import '../../../Widget/PageTitle.dart';
import '../SignUp/Custom/OTPRichText.dart';
import '../../../Widget/OTPTextFormField.dart';

class VertificationScreen extends StatelessWidget {
  const VertificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OtpVertificationPasswordImplement());
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<OtpVertificationPasswordImplement>(
            builder: (controller) => HandilingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Column(children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const PageTitle(
                          title: 'OTP Verification',
                          backArrowVisiablity: true,
                        ),
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
                        const OtpRichText(),
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
                        // CustomButton(
                        //   onTap: () => controller.otpValidate(),
                        //   buttonBody: 'Continue',
                        //   leftPadding:AppSize.screenWidth* 0.34,
                        //   rightPadding: AppSize.screenWidth* 0.34,
                        // ),
                        // const SizedBox(height: 80),
                        // const Text('Resend OTP Code',
                        //     style: TextStyle(
                        //         color:AppColor. deepGrey,
                        //         fontSize: 15,
                        //         fontFamily: 'muli',
                        //         decoration: TextDecoration.underline)),
                      ]),
                    ),
                  ),
                )),
      ),
    );
  }
}
