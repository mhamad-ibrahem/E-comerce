import 'package:ecommerce/Core/Constant/ScreenSize.dart';
import 'package:ecommerce/Core/classes/handilingData.dart';
import 'package:ecommerce/controller/Profile/ProfileController.dart';
import 'package:ecommerce/view/Screens/Profile/ProfileChildren/Account/EditingFormsScreen.dart';
import 'package:ecommerce/view/Screens/Profile/ProfileCustoms/ProfilePicture.dart';
import 'package:ecommerce/view/Widget/CustomAppPage.dart';
import 'package:ecommerce/view/Widget/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({super.key});
  final ProfileImplement controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return CustomAppPage(
      isScroll: true,
      title: "Account",
      backArrowVisiablity: true,
      body: GetBuilder<ProfileImplement>(
        builder: (controller) => HandilingDataRequest(
          statusRequest: controller.statusRequest2,
          widget: Column(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Center(child: ProfilePicture()),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.profileModel.name,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        Text(
                          controller.profileModel.email,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      " Edite Profile :",
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(fontSize: 20),
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
                            onTap: () {
                              controller.updateProfile();
                            },
                            buttonWidth: AppSize.screenWidth * 0.75)),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
