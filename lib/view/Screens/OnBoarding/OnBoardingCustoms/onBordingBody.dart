import 'package:flutter/material.dart';

import '../../../../Core/Constant/ScreenSize.dart';

class OnBordingBody extends StatelessWidget {
  const OnBordingBody({super.key, required this.title, required this.image});
  final String title;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(title, style: Theme.of(context).textTheme.headline6),
      const SizedBox(
        height: 20,
      ),
      Image.asset(
        image,
        height:AppSize.screenHight * 0.3,
        width:AppSize.screenWidth * 0.6,
        fit: BoxFit.fill,
      ),
      const SizedBox(
        height: 40,
      ),
    ]);
  }
}
