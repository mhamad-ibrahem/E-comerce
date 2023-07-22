import 'package:ecommerce/Core/Constant/ScreenSize.dart';
import 'package:ecommerce/Core/Constant/imageAsset.dart';
import 'package:ecommerce/Core/classes/statusRequest.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../view/Widget/CustomButton.dart';

class HandilingDataView extends StatelessWidget {
  const HandilingDataView(
      {super.key,
      required this.statusRequest,
      required this.widget,
      this.onPressed});
  final StatusRequest statusRequest;
  final Widget widget;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(AppImageAsset.loadingImage,
                width: 50, height: 50, fit: BoxFit.fill))
        : statusRequest == StatusRequest.faliure
            ? Center(child: Lottie.asset(AppImageAsset.errorImage))
            : statusRequest == StatusRequest.offlineFaliure
                ? Column(
                    children: [
                      Center(
                        child: Lottie.asset(AppImageAsset.offlineImage,
                            width: 200, height: 200, fit: BoxFit.fill),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                        buttonBody: 'Retry',
                        onTap: onPressed,
                        buttonWidth: AppSize.screenWidth * 0.5,
                      )
                    ],
                  )
                : statusRequest == StatusRequest.serverFaliure
                    ? Center(
                        child: Lottie.asset(AppImageAsset.serverErrorImage,
                            width: 400, height: 400))
                    : widget;
  }
}

class HandilingDataRequest extends StatelessWidget {
  const HandilingDataRequest(
      {super.key, required this.statusRequest, required this.widget});
  final StatusRequest statusRequest;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(AppImageAsset.loadingImage,
                width: 50, height: 50, fit: BoxFit.fill))
        : widget;
  }
}
