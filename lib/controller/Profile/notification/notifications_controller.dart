import 'package:ecommerce/Core/classes/HiveBox.dart';
import 'package:ecommerce/Core/classes/statusRequest.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../Core/classes/HiveKeys.dart';
import '../../../Core/functions/handilingData.dart';
import '../../../data/DataSource/remote/notifications/notifications_data.dart';
import '../../../data/model/notifications/notification_model.dart';

class NotificationsController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  List<NotificationsModel> notificationsList = [];
  Box authBox = Hive.box(HiveBox.authBox);
  NotififcationsData notififcationsData = NotififcationsData(Get.find());
  getNotifications() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await notififcationsData.getData(authBox.get(HiveKeys.idKey));
    statusRequest = handilingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List reponseList = response['data'];
        notificationsList =
            reponseList.map((e) => NotificationsModel.fromJson(e)).toList();
        print('==============================${notificationsList.length}');
      } else {
        statusRequest = StatusRequest.faliure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getNotifications();
    super.onInit();
  }
}
