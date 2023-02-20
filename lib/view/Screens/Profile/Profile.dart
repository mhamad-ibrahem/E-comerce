import 'package:ecommerce/Core/Constant/ScreenSize.dart';
import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:ecommerce/controller/Profile/ProfileController.dart';
import 'package:ecommerce/view/Widget/CustomAppPage.dart';
import 'package:ecommerce/view/Widget/PageTitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'ProfileCustoms/ProfileItem.dart';
import 'ProfileCustoms/ProfilePicture.dart';

class ProfilePage extends GetView<ProfileImplement> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileImplement());
    return CustomAppPage(
      isScroll: false,
        title: "Profile",
        backArrowVisiablity: false,
        body:
            SizedBox(
              height: AppSize.screenHight *0.77,
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          const SizedBox(
              height: 10,
          ),
          const ProfilePicture(),
          const SizedBox(
              height: 10,
          ),
          ProfileItem(
              title: 'My Account',
              icon: Icons.person_outline_outlined,
              onTap: () {
                controller.goToAccount();
              },
          ),
          ProfileItem(
                title: 'Notifications',
                icon: Icons.notifications_none_outlined,
                onTap: () {
                  controller.goToNotification();
                }),
          ProfileItem(
                title: 'Settings',
                icon: Icons.settings_outlined,
                onTap: () => controller.goToSettings()),
          ProfileItem(
                title: 'Help Center',
                icon: Icons.help_outline,
                onTap: () {
                  controller.goToHelp();
                }),
          ProfileItem(
                title: 'Log Out',
                icon: Icons.logout_outlined,
                onTap: () {
                  controller.logOut();
                }),
          const SizedBox(
              height: 10,
          ),
        ]),
            ));
  }
}
