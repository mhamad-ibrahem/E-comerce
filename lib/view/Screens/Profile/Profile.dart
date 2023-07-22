import 'package:ecommerce/controller/Profile/ProfileController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'ProfileCustoms/ProfileItem.dart';
import 'ProfileCustoms/ProfilePicture.dart';

class ProfilePage extends GetView<ProfileImplement> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileImplement());
    return Scaffold(
      body: SingleChildScrollView(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          const SizedBox(
            height: 30,
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
              title: 'Address',
              icon: Icons.add_location,
              onTap: () => controller.goToAddress()),
          ProfileItem(
              title: 'Orders',
              icon: Icons.list_alt,
              onTap: () => controller.goToOrders()),
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
      ),
    );
  }
}
