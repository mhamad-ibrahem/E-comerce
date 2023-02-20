import 'package:ecommerce/Core/Constant/ScreenSize.dart';
import 'package:ecommerce/view/Widget/CustomAppPage.dart';
import 'package:ecommerce/view/Widget/CustomButton.dart';
import 'package:flutter/material.dart';

import 'NotifiactionBody.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppPage(
      isScroll: true,
      title: "Notifications",
      backArrowVisiablity: true,
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: AppSize.screenHight * 0.65,
            child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                      height: 5,
                    ),
                itemCount: 4,
                itemBuilder: (context, index) => NotifiactionsBody(
                      notificationsTitle: "Title",
                      notificationsSubTitle: "subTitle",
                      onDismissed: (dismissed) {},
                      onTap: () {
                        print("object");
                      },
                    )),
          ),
          const SizedBox(
            height: 30,
          ),
          CustomButton(
              buttonBody: "Remove All",
              onTap: () {},
              buttonWidth: AppSize.screenWidth * 0.75),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
      
    );
  }
}
