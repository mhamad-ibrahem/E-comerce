import 'package:ecommerce/Constant/Colors.dart';
import 'package:ecommerce/controller/OnboardingController.dart';
import 'package:ecommerce/model/Themes.dart';
import 'package:ecommerce/view/OnBoarding/OnBoardingCustoms/DotsIndicator.dart';
import 'package:ecommerce/view/OnBoarding/OnBoardingCustoms/OnBoradingPageViewImages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../CutomWidgets/CustomButton.dart';
import 'OnBoardingCustoms/OnBoradingPageViewText.dart';

class OnBorading extends StatelessWidget {
  OnBorading({Key? key}) : super(key: key);
  final OnBoardingController _controller = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    _controller.getHieghtWidth(context);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    'StoreX',
                    style: TextStyle(
                        color: orange,
                        fontSize: 40,
                        fontFamily: 'muli',
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  OnBoradingPageViewText(controller: _controller),
                ],
              ),
              Column(
                children: [
                  OnBoradingPageViewImages(controller: _controller),
                  const SizedBox(
                    height: 60,
                  ),
                  DotsIndicator(controller: _controller)
                ],
              ),
              CustomButton(
                onTap: () => _controller.nextPage(),
                buttonBody: 'Continue',
                buttonradius: 25,
                containerWidth: 300,
              )
            ],
          ),
        ),
      ),
    );
  }
}
