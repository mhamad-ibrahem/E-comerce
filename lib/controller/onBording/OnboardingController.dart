import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:ecommerce/data/DataSource/static/staticOnBording.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../Core/services/Services.dart';

abstract class OnBoardingController extends GetxController {
  onPageChanged(int index);

  moveToNextPage();
}

class OnBordingImplement extends OnBoardingController {
  int currentPage = 0;
  late PageController pageController;
  Services services = Get.find();
  @override
  moveToNextPage() {
    currentPage++;
    if (currentPage > onBoardingList.length - 1) {
      services.box.put('onBording', '1');
      services.box.close();
      Get.offAllNamed(
        AppRoute.signIn,);
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 800), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
