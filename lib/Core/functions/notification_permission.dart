import 'dart:developer';
import 'package:ecommerce/controller/Profile/orders/orderController.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

requestNotificationPermission() async {
  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

fcmConfig() {
  log('Fcm Config ........');
  FirebaseMessaging.onMessage.listen((event) {
    log('${event.notification!.title}');
    log('${event.notification!.body}');
    Get.snackbar(event.notification!.title!, event.notification!.body!);
    FlutterRingtonePlayer.playNotification();
    refreshPageNotification(event.data);
  });
}

refreshPageNotification(data) {
  if (Get.currentRoute == "/orders" &&
      data['pagename'] == 'refreshOrderPending') {
    OrderController controller = Get.find();
    controller.getOrders();
  }
}
