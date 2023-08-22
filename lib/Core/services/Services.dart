import 'package:ecommerce/Core/classes/HiveBox.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../firebase_options.dart';
import '../classes/notifications.dart';

class Services extends GetxService {
  late Box box;
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  Future<Services> init() async {
    // await Firebase.initializeApp();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await Hive.initFlutter();
    box = await Hive.openBox(HiveBox.authBox);
    box = await Hive.openBox(HiveBox.stepBox);
    NotificationService.init();

    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => Services().init());
}
