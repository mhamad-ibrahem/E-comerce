import 'package:ecommerce/Core/Constant/Colors.dart';
import 'package:ecommerce/Core/Constant/ScreenSize.dart';
import 'package:ecommerce/controller/Auth/SignIn/SignInController.dart';
import 'package:ecommerce/controller/onBording/OnboardingController.dart';
import 'package:ecommerce/data/DataSource/static/staticOnBording.dart';
import 'package:ecommerce/view/Screens/OnBoarding/OnBoardingCustoms/onBordingBody.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Widget/CustomButton.dart';
import 'OnBoardingCustoms/DotsIndicator.dart';

class OnBording extends GetView<OnBordingImplement> {
  OnBording({Key? key}) : super(key: key);

  final OnBordingImplement _controller = Get.put(OnBordingImplement());

  @override
  Widget build(BuildContext context) {
    Get.put(SignInImplement());
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             const Text(
                'JO Store',
                style:TextStyle(
                    color:AppColor. orange,
                    fontSize: 35,
                    fontFamily: 'muli',
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: AppSize.screenHight * 0.45,
                child: PageView.builder(
                  onPageChanged: (index) {
                    _controller.onPageChanged(index);
                  },
                  controller: _controller.pageController,
                  itemCount: onBoardingList.length,
                  itemBuilder: (context, index) => OnBordingBody(
                      title: onBoardingList[index].subtitle!,
                      image: onBoardingList[index].image),
                ),
              ),
              const DotsIndicator(),
              CustomButton(
                onTap: _controller.moveToNextPage,
                buttonBody: 'Continue',
                leftPadding: AppSize.screenWidth * 0.34,
                rightPadding: AppSize.screenWidth * 0.34,
              )
            ],
          ),
        ),
      ),
    );
  }
}
