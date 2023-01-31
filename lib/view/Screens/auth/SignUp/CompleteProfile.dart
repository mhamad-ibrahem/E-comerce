import 'package:ecommerce/Core/classes/HandilingData.dart';
import 'package:ecommerce/Core/classes/statusRequest.dart';
import 'package:ecommerce/controller/Auth/SignUp/SignUpController.dart';
import 'package:ecommerce/view/Widget/CustomButton.dart';
import 'package:ecommerce/view/Screens/auth/SignUp/Custom/TermsAndConditions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Core/Constant/ScreenSize.dart';
import '../../../Widget/PageTitle.dart';
import 'Custom/CompleteProfileTextFields.dart';

class CompleteProfile extends StatelessWidget {
  CompleteProfile({Key? key}) : super(key: key);
  final SignUpImplement controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: GetBuilder<SignUpImplement>(
              builder: (controller) => HandilingDataRequest(
                    statusRequest: controller.statusRequest,
                    widget: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SingleChildScrollView(
                        child: Form(
                          key: controller.completeState,
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
                                'Complete Profile',
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
                                height: 30,
                              ),
                              const CompleteProfileTextFields(),
                              SizedBox(
                                height: AppSize.screenHight * 0.08,
                              ),
                              CustomButton(
                                onTap: () => controller.completevalidate(),
                                buttonBody: 'Continue',
                                buttonWidth: AppSize.screenWidth * 0.75
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              const TermsAndConditions()
                            ],
                          ),
                        ),
                      ),
                    ),
                  ))),
    );
  }
}
