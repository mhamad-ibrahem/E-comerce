import 'package:ecommerce/Core/Constant/ScreenSize.dart';
import 'package:ecommerce/controller/Profile/ProfileController.dart';
import 'package:ecommerce/controller/Profile/account/AccountController.dart';
import 'package:ecommerce/view/Screens/Profile/ProfileChildren/Account/EditingFormsScreen.dart';
import 'package:ecommerce/view/Screens/Profile/ProfileCustoms/ProfilePicture.dart';
import 'package:ecommerce/view/Widget/CustomAppPage.dart';
import 'package:ecommerce/view/Widget/CustomButton.dart';
import 'package:ecommerce/view/Widget/PageTitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AccountImplement());
    return CustomAppPage(
      isScroll: true,
      title: "Account",
      backArrowVisiablity: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Center(child: ProfilePicture()),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "userName",
                style: Theme.of(context).textTheme.headline2,
              ),
              Text(
                "userAccount@gmail.com",
                style: Theme.of(context).textTheme.headline2,
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            " Edite Profile :",
            style:
                Theme.of(context).textTheme.headline4!.copyWith(fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          const EditingFormsScreen(),
          const SizedBox(
            height: 20,
          ),
          Center(
              child: CustomButton(
                  buttonBody: "Save",
                  onTap: () {},
                  buttonWidth: AppSize.screenWidth * 0.75))
        ],
      ),
    );
  }
}
