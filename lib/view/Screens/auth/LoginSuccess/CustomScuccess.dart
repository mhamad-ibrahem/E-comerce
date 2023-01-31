import 'package:ecommerce/Core/Constant/imageAsset.dart';
import 'package:ecommerce/view/Widget/CustomButton.dart';
import 'package:flutter/material.dart';

import '../../../../Core/Constant/ScreenSize.dart';

class CustomSuccess extends StatelessWidget {
  const CustomSuccess(
      {Key? key,
      required this.textSuccess,
      required this.buttonText,
      required this.function})
      : super(key: key);
  final String textSuccess;
  final String buttonText;
  final VoidCallback function;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Congrats',
                style: Theme.of(context).textTheme.headline3,
              ),
              const SizedBox(),
              SizedBox(child: Image.asset(AppImageAsset.loginSuccessimage)),
              Text(
                textSuccess,
                style: Theme.of(context).textTheme.headline4,
              ),
              CustomButton(
                onTap: function,
                buttonBody: buttonText,
                buttonWidth: AppSize.screenWidth * 0.75
              )
            ],
          ),
        ),
      ),
    );
  }
}
