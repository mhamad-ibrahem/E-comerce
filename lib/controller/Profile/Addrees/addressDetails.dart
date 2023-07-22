import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:ecommerce/Core/functions/handilingData.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../Core/classes/HiveBox.dart';
import '../../../Core/classes/HiveKeys.dart';
import '../../../Core/classes/statusRequest.dart';
import '../../../data/DataSource/remote/Address/AddressData.dart';

abstract class AddreesDetailsController extends GetxController {
  addAdress();
  initialData();
}

class AddreesDetailsImplement extends AddreesDetailsController {
  AddressData addressData = AddressData(Get.find());
  Box authBox = Hive.box(HiveBox.authBox);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;
  String? lat;
  String? lang;
  StatusRequest? statusRequest = StatusRequest.none;
  @override
  addAdress() async {
    var formData = formKey.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await addressData.addAddress(authBox.get(HiveKeys.idKey),
          city!.text, street!.text, lat!, lang!, name!.text);
      statusRequest = handilingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          Get.offAllNamed(
            AppRoute.mainPage,
          );
        } else {
          statusRequest = StatusRequest.faliure;
        }
      }
    }
    update();
  }

  @override
  initialData() {
    lat = Get.arguments['lat'];
    lang = Get.arguments['lang'];
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
  }

  @override
  void onInit() {
    initialData();
    print("===============================");
    print(lat);
    print(lang);
    super.onInit();
  }
}
