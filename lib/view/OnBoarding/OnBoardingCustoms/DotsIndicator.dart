import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../Constant/Colors.dart';
import '../../../controller/OnboardingController.dart';

class DotsIndicator extends StatelessWidget {
  const DotsIndicator({
    Key? key,
    required OnBoardingController controller,
  })  : _controller = controller,
        super(key: key);

  final OnBoardingController _controller;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingController>(
      builder: (controller) => AnimatedSmoothIndicator(
        duration: const Duration(seconds: 1),
        effect: WormEffect(
            activeDotColor: orange, dotHeight: 7, dotWidth: 7, dotColor: grey),
        count: 3,
        activeIndex: _controller.currentPos,
      ),
    );
  }
}
