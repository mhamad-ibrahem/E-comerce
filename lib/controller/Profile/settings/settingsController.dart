import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SettingsController extends GetxController {
  enableNotifiacation(bool val);
  askBeforBy(bool val);
  enableDarkMode(bool val);
}

class SettingsImplement extends SettingsController {
  bool ask = false;
  bool isDarkMode = false;
  bool noticifcationEnaled = false;
  @override
  askBeforBy(val) {
    ask = val;
    update();
  }

  @override
  enableDarkMode(val) {
    isDarkMode = val;
    update();
  }

  @override
  enableNotifiacation(val) {
    noticifcationEnaled = val;
    update();
  }
}
