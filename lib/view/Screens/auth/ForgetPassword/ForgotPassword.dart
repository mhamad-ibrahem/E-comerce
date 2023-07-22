import 'package:ecommerce/Core/classes/HandilingData.dart';
import 'package:ecommerce/controller/Auth/ForgetPassword/forgetPasswordController.dart';
import 'package:ecommerce/view/Widget/CustomButton.dart';
import 'package:ecommerce/view/Widget/CustomTextFormField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Core/Constant/ScreenSize.dart';
import '../../../../Core/functions/Validation.dart';
import '../../../Widget/PageTitle.dart';
import '../../../Widget/custom_app_bar.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut((() => ForgetPasswordImplement()));
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar(context, "Forgot Password", true),
        body: GetBuilder<ForgetPasswordImplement>(
            builder: (controller) => HandilingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              'Forgot Password',
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Please enter your email and we will send\nyou a link to return to your account',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 6,
                            ),
                            Form(
                              key: controller.forgotPassState,
                              child: CustomTextFormField(
                                  icon: Icons.email_outlined,
                                  label: 'Email',
                                  hint: 'Enter your email',
                                  obscure: false,
                                  textEditingController:
                                      controller.forgotPasswordemail,
                                  suffixIcon: null,
                                  validator: (value) {
                                    return validation(value!, 14, 30, 'email');
                                  }),
                            ),
                            SizedBox(
                              height: AppSize.screenHight * 0.29,
                            ),
                            CustomButton(
                                onTap: () {
                                  controller.forgotPassvalidate();
                                },
                                buttonBody: 'Continue',
                                buttonWidth: AppSize.screenWidth * 0.75),
                            const SizedBox(height: 60),
                          ],
                        ),
                      )),
                )),
      ),
    );
  }
}
