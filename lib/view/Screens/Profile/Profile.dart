import 'package:ecommerce/Core/classes/HandilingData.dart';
import 'package:ecommerce/controller/Profile/ProfileController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Core/Constant/routes.dart';
import 'ProfileCustoms/ProfileItem.dart';
import 'ProfileCustoms/ProfilePicture.dart';

class ProfilePage extends GetView<ProfileImplement> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileImplement());
    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<ProfileImplement>(
          builder: (controller) => HandilingDataView(
            statusRequest: controller.statusRequest,
            onPressed: () {
              controller.getProfileData();
            },
            widget: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  ProfilePicture(isProfile: true),
                  const SizedBox(
                    height: 10,
                  ),
                  ProfileItem(
                    title: 'My Account',
                    icon: Icons.person_outline_outlined,
                    onTap: () {
                      Get.toNamed(AppRoute.account);
                    },
                  ),
                  ProfileItem(
                      title: 'Notifications',
                      icon: Icons.notifications_none_outlined,
                      onTap: () {
                        Get.toNamed(AppRoute.notifications);
                      }),
                  ProfileItem(
                      title: 'Address',
                      icon: Icons.add_location,
                      onTap: () => Get.toNamed(AppRoute.address)),
                  ProfileItem(
                      title: 'Orders',
                      icon: Icons.list_alt,
                      onTap: () => Get.toNamed(AppRoute.orders)),
                  ProfileItem(
                      title: 'Settings',
                      icon: Icons.settings_outlined,
                      onTap: () => Get.toNamed(AppRoute.settings)),
                  ProfileItem(
                      title: 'Help Center',
                      icon: Icons.help_outline,
                      onTap: () {
                        Get.toNamed(AppRoute.helpCenter);
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
          ),
        ),
      ),
    );
  }
}
