
import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:ecommerce/view/Widget/PageTitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ProfileCustoms/ProfileItem.dart';
import 'ProfileCustoms/ProfilePicture.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      const PageTitle(title: 'Profile', backArrowVisiablity: false,),
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
        onTap: () {},
      ),
      ProfileItem(
          title: 'Notifications',
          icon: Icons.notifications_none_outlined,
          onTap: () {}),
      ProfileItem(
          title: 'Settings',
          icon: Icons.settings_outlined,
          onTap: () => Get.toNamed(AppRoute.settings)),
      ProfileItem(title: 'Help Center', icon: Icons.help_outline, onTap: () {}),
      ProfileItem(title: 'Log Out', icon: Icons.logout_outlined, onTap: () {}),
      const SizedBox(
        height: 10,
      ),
    ]);
  }
}
