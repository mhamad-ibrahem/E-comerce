import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:ecommerce/Core/classes/HiveBox.dart';
import 'package:ecommerce/Core/classes/HiveKeys.dart';
import 'package:ecommerce/data/DataSource/static/staticOnBording.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../Core/services/Services.dart';

abstract class OnBoardingController extends GetxController {
  onPageChanged(int index);

  moveToNextPage();
}

class OnBordingImplement extends OnBoardingController {
  Box? stepBox;
  int currentPage = 0;
  late PageController pageController;
  @override
  moveToNextPage() {
    currentPage++;
    if (currentPage > onBoardingList.length - 1) {
      stepBox!.put(HiveKeys.stepKey, '1');
      stepBox!.close();
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
  openStepBox()async{
   stepBox = await Hive.openBox(HiveBox.stepBox); 
  }
  @override
  void onInit() {
    openStepBox();
    pageController = PageController();
    super.onInit();
  }
}
