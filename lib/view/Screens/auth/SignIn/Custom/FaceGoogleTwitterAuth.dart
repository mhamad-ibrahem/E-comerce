import 'package:ecommerce/Core/Constant/ScreenSize.dart';
import 'package:ecommerce/Core/Constant/imageAsset.dart';
import 'package:flutter/material.dart';

class FaceGoogleTwitterAuth extends StatelessWidget {
  const FaceGoogleTwitterAuth({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      padding: EdgeInsets.symmetric(
          horizontal: AppSize.screenWidth / 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(AppImageAsset.googleimage),
          Image.asset(AppImageAsset.faceBookimage),
          Image.asset(AppImageAsset.twitterimage)
        ],
      ),
    );
  }
}
