import 'package:ecommerce/Core/classes/HiveBox.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Services extends GetxService {
  late Box box;
  Future<Services> init() async {
    await Firebase.initializeApp();
    await Hive.initFlutter();
    box = await Hive.openBox(HiveBox.authBox);
    box = await Hive.openBox(HiveBox.stepBox);
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => Services().init());
}

