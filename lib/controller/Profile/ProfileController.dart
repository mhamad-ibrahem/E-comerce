import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:ecommerce/Core/classes/HiveBox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

abstract class ProfileController extends GetxController{
  goToAccount();
  goToSettings();
  goToNotification();
  goToHelp();
  logOut();
}

class ProfileImplement extends ProfileController{
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
  logOut() {
   Get.offAllNamed(AppRoute.onBording);
   Hive.box(HiveBox.authBox).clear();
  }

}