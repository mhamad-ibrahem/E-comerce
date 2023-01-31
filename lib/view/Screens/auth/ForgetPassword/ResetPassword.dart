import 'package:ecommerce/Core/classes/HandilingData.dart';
import 'package:ecommerce/controller/Auth/ForgetPassword/ResetPasswordController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Core/Constant/ScreenSize.dart';
import '../../../Widget/CustomButton.dart';
import '../../../Widget/PageTitle.dart';
import 'Custom/ResetPasswordForm.dart';

class ResetPasswordPage extends StatelessWidget {
  ResetPasswordPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ResetPasswordImplement());
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<ResetPasswordImplement>(
            builder: (controller) => HandilingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const PageTitle(
                              title: 'Reset Password',
                              backArrowVisiablity: true,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              'Enter new password',
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Enter a new password and confirm\nit to restore your account',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            const SizedBox(
                              height: 60,
                            ),
                            // The Text Form Field For Sign In Page
                            Form(
                                key: controller.confirmState,
                                child: const ResetPasswordForm()),
                            SizedBox(
                              height: AppSize.screenHight * 0.28,
                            ),

                            CustomButton(
                              onTap: () {
                                controller.goToLoginValidate();
                              },
                              buttonBody: 'Continue',
                              buttonWidth: AppSize.screenWidth * 0.75
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                          ],
                        ),
                      )),
                )),
      ),
    );
  }
}
