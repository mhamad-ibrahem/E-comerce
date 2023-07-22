import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:ecommerce/Core/classes/HiveBox.dart';
import 'package:ecommerce/Core/classes/HiveKeys.dart';
import 'package:ecommerce/view/Screens/OnBoarding/onBoardingPage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

abstract class ProfileController extends GetxController {
  goToAccount();
  goToSettings();
  goToOrders();
  goToNotification();
  goToHelp();
  logOut();
  goToAddress();
}

class ProfileImplement extends ProfileController {
  Box authBox = Hive.box(HiveBox.authBox);
  @override
  goToAccount() {
    Get.toNamed(AppRoute.account);
  }

  @override
  goToHelp() {
    Get.toNamed(AppRoute.helpCenter);
  }

  @override
  goToNotification() {
    Get.toNamed(AppRoute.notifications);
  }

  @override
  goToSettings() {
    Get.toNamed(AppRoute.settings);
  }

  @override
  goToOrders() {
    Get.toNamed(AppRoute.orders);
  }

  @override
  logOut() async {
    String userId = authBox.get(HiveKeys.idKey);
    FirebaseMessaging.instance.unsubscribeFromTopic('users');
    FirebaseMessaging.instance.unsubscribeFromTopic('users$userId');
    await Hive.box(HiveBox.authBox).clear();
    await Hive.box(HiveBox.stepBox).clear();
    Get.offAll(OnBording());
  }

  @override
  goToAddress() {
    Get.toNamed(AppRoute.address);
  }
}
