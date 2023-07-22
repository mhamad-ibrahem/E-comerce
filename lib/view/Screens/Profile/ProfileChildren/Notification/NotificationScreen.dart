import 'package:ecommerce/Core/Constant/ScreenSize.dart';
import 'package:ecommerce/Core/classes/HandilingData.dart';
import 'package:ecommerce/view/Widget/CustomAppPage.dart';
import 'package:ecommerce/view/Widget/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controller/Profile/notification/notifications_controller.dart';
import 'NotifiactionBody.dart';

class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({super.key});
  final NotificationsController controller = Get.put(NotificationsController());
  @override
  Widget build(BuildContext context) {
    return CustomAppPage(
      isScroll: true,
      title: "Notifications",
      backArrowVisiablity: true,
      body: GetBuilder<NotificationsController>(
        builder: (controller) => HandilingDataView(
          statusRequest: controller.statusRequest,
          onPressed: () async {
            await controller.getNotifications();
          },
          widget: Column(
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
                    itemCount: controller.notificationsList.length,
                    itemBuilder: (context, index) => NotifiactionsBody(
                          notificationsTitle: controller
                              .notificationsList[index].notificationTitle,
                          notificationsSubTitle: controller
                              .notificationsList[index].notificationSubTitle,
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
        ),
      ),
    );
  }
}
