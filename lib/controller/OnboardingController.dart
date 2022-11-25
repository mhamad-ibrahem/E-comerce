import 'package:ecommerce/view/Screens/auth/SignIn.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class OnBoardingController extends GetxController {
  PageController imagesPageController = PageController();
  PageController textController = PageController();
  late double height, width;
  int currentPos = 0;
  getHieghtWidth(BuildContext context) {
    height = MediaQuery.of(context).size.height / 3;
    width = MediaQuery.of(context).size.width;
  }

  nextPage() {
    if (currentPos < 2) {
      currentPos = currentPos + 1;
      imagesPageController.nextPage(
          duration: const Duration(seconds: 1), curve: Curves.linear);
      textController.nextPage(
          duration: const Duration(seconds: 1), curve: Curves.linear);
    } else {
      Get.to(() => SignIn());
    }

    update();
  }

  @override
  void onInit() {
    imagesPageController = PageController(initialPage: 0);
    textController = PageController(initialPage: 0);
    super.onInit();
  }
}
