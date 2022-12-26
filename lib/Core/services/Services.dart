import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Services extends GetxService {
  late Box box;
  Future<Services> init() async {
    await Hive.initFlutter();
    box = await Hive.openBox('box');
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => Services().init());
}

// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Services extends GetxService {
//   late SharedPreferences sharedPreferences;
//   Future<Services> init() async {
//     sharedPreferences = await SharedPreferences.getInstance();
//     return this;
//   }
// }

// initialServices() async {
//   await Get.putAsync(() => Services().init());
// }

