import 'package:ecommerce/Core/Constant/Colors.dart';
import 'package:ecommerce/controller/onBording/OnboardingController.dart';
import 'package:ecommerce/data/DataSource/static/staticOnBording.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DotsIndicator extends StatelessWidget {
  const DotsIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBordingImplement>(
        builder: ((controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    onBoardingList.length,
                    (index) => AnimatedContainer(
                      margin:const EdgeInsets.only(right: 5),
                          duration: const Duration(milliseconds: 900),
                          width: controller.currentPage == index ? 20 : 5,
                          height: 6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color:AppColor. orange
                          ),
                        ),
                        )
              ],
            )));
  }
}
