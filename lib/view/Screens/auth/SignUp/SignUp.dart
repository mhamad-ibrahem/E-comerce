
import 'package:ecommerce/controller/Auth/SignUp/SignUpController.dart';
import 'package:ecommerce/view/Widget/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Core/Constant/ScreenSize.dart';
import '../../../Widget/PageTitle.dart';
import '../SignIn/Custom/FaceGoogleTwitterAuth.dart';
import 'Custom/RegesterationTextFormFieldes.dart';
import 'Custom/TermsAndConditions.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SignUpImplement());
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: GetBuilder<SignUpImplement>(
              builder: (controller) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Form(
                      key: controller.signUpState,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const PageTitle(
                            title: 'Sign Up',
                            backArrowVisiablity: true,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Register Account',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Complete your details or continue\nwith social media',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          // The Text Form Field For Sign up Page
                          const RegesterationTextFormFieldes(),
                          const SizedBox(
                            height: 40,
                          ),
                          CustomButton(
                            onTap: () => controller.signUpvalidate(),
                            buttonBody: 'Continue',
                            buttonWidth: AppSize.screenWidth * 0.75
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          // FaceBook Goggle Twitter Logos
                          const FaceGoogleTwitterAuth(),
                          const SizedBox(
                            height: 20,
                          ),
                          // The Terms and Conditions Text
                          const TermsAndConditions(),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  )),
        ),
      ),
    );
  }
}
