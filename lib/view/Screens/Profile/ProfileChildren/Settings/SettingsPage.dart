import 'package:ecommerce/controller/Profile/settings/settingsController.dart';
import 'package:ecommerce/view/Widget/CustomAppPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'SettingsCustoms/SettingsSwitch.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsImplement(), permanent: true);
    return CustomAppPage(
        isScroll: false,
        title: "Settings",
        backArrowVisiablity: true,
        body: GetBuilder<SettingsImplement>(
          builder: (controller) => Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              SettingsSwitch(
                title: 'Notifications',
                onChanged: (val) {
                  controller.enableNotifiacation(val);
                },
                checkValue: controller.noticifcationEnaled,
              ),
              const SizedBox(
                height: 10,
              ),
              SettingsSwitch(
                  checkValue: controller.ask,
                  title: 'Ask before buy',
                  onChanged: (val) {
                    controller.askBeforBy(val);
                  }),
              const SizedBox(
                height: 10,
              ),
              SettingsSwitch(
                  checkValue: controller.isDarkMode,
                  title: 'Dark Mode',
                  onChanged: (val) {
                    controller.enableDarkMode(val);
                  })
            ],
          ),
        ));
  }
}
