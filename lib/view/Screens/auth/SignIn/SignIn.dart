
import 'package:ecommerce/controller/Auth/SignIn/SignInController.dart';
import 'package:ecommerce/view/Widget/CustomButton.dart';
import 'package:ecommerce/view/Screens/auth/SignIn/Custom/FaceGoogleTwitterAuth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Core/Constant/ScreenSize.dart';
import '../../../../Core/classes/HandilingData.dart';
import '../../../../Core/functions/AlertFunction.dart';
import '../../../Widget/PageTitle.dart';
import 'Custom/DontHaveAccount.dart';
import 'Custom/ForgotPasswordRow.dart';
import 'Custom/SignInTextFormFields.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignInImplement());
    return SafeArea(
        child: WillPopScope(
      onWillPop: closeAppDialog,
      child: Scaffold(
        body: GetBuilder<SignInImplement>(
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
                          title: 'Sign In',
                          backArrowVisiablity: false,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Welcom Back',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Sign in with email and password\nor continue with social media',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        // The Text Form Field For Sign In Page
                        Form(
                          key: controller.signinState,
                          child: const SignInTextFormFields(),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        // Forgot password and Remmember me Row
                        const ForgotPasswordRow(),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomButton(
                          onTap: () {
                            controller.signInvalidate();
                          },
                          buttonBody: 'Continue',
                         buttonWidth: AppSize.screenWidth * 0.75,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        // FaceBook Goggle Twitter Logos
                        const FaceGoogleTwitterAuth(),
                        const SizedBox(
                          height: 20,
                        ),
                        // Don't Have an Acount TextButton
                        const DontHaveAccount(),
                      ],
                    )),
                  ),
                )),
      ),
    ));
  }
}
