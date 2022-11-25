import 'package:flutter/material.dart';

import '../../../../controller/OnboardingController.dart';
import '../../../../Core/Theme/Themes.dart';

class OnBoradingPageViewText extends StatelessWidget {
  const OnBoradingPageViewText({
    Key? key,
    required OnBoardingController controller,
  })  : _controller = controller,
        super(key: key);

  final OnBoardingController _controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _controller.textController,
        children: [
          Center(
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: 'Welcome to ',
                      style: Themes().currentTheme.textTheme.headline6),
                  TextSpan(
                      text: 'Storex',
                      style: Themes().currentTheme.textTheme.headline3),
                  TextSpan(
                      text: ', Let\'s shop!.',
                      style: Themes().currentTheme.textTheme.headline6),
                ],
              ),
            ),
          ),
          Center(
            child: Text('You Can Buy Whatevere \nYou Want From Home.',
                style: Themes().currentTheme.textTheme.headline6),
          ),
          Center(
            child: Text(
                'You Can Buy Anything Laptops,\nClothes,Gaming Accessories.',
                style: Themes().currentTheme.textTheme.headline6),
          )
        ],
      ),
    );
  }
}
