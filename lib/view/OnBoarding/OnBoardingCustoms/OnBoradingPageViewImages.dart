import 'package:flutter/material.dart';

import '../../../controller/OnboardingController.dart';

class OnBoradingPageViewImages extends StatelessWidget {
  const OnBoradingPageViewImages({
    Key? key,
    required OnBoardingController controller,
  })  : _controller = controller,
        super(key: key);

  final OnBoardingController _controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _controller.height,
      width: _controller.width,
      child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _controller.imagesPageController,
          children: [
            Image.asset(
              "assets/images/splash_1.png",
            ),
            Image.asset(
              "assets/images/splash_2.png",
            ),
            Image.asset(
              "assets/images/splash_3.png",
            ),
          ]),
    );
  }
}
