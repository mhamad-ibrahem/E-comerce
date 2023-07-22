import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:ecommerce/Core/classes/HiveBox.dart';
import 'package:ecommerce/Core/classes/HiveKeys.dart';
import 'package:ecommerce/Core/classes/statusRequest.dart';
import 'package:ecommerce/Core/functions/handilingData.dart';
import 'package:ecommerce/data/DataSource/remote/Address/AddressData.dart';
import 'package:ecommerce/data/DataSource/remote/orders/OrdersData.dart';
import 'package:ecommerce/data/model/addess/addressModel.dart';
import 'package:ecommerce/view/Widget/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../Core/Constant/Colors.dart';

class CheckOutController extends GetxController {
  String paymentMethod = '';
  late String dilveryMethod;
  List<AddressModel> addressList = [];
  bool isDelivery = false;
  int? selectedAddress;
  StatusRequest statusRequest = StatusRequest.none;
  AddressData addressData = AddressData(Get.find());
  OrdersData ordersData = OrdersData(Get.find());
  Box authBox = Hive.box(HiveBox.authBox);
  bool canPlaceOrder = false;
  double totalPrice = Get.arguments['totalPrice'];
  getAddress() async {
    statusRequest = StatusRequest.loading;
    var response = await addressData.viewAddress(authBox.get(HiveKeys.idKey));
    statusRequest = handilingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List responsedata = response['data'];
        addressList.addAll(responsedata.map((e) => AddressModel.fromJson(e)));
        dilveryMethod = "";
        if (addressList.length == 1) {
          selectedAddress = 0;
        }
      } else {
        dilveryMethod = "Drive Through";
      }
    }
    update();
  }

  choosePayemntMethod(String method) {
    paymentMethod = method;
    handleOrderButton();
    update();
  }

  chooseDeliveryMethod(String method, BuildContext context) {
    if (addressList.isNotEmpty) {
      dilveryMethod = method;
      method == "Delivery" ? isDelivery = true : isDelivery = false;
    } else {
      if (method == "Delivery") {
        Get.defaultDialog(
            title: "No address",
            titleStyle: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(color: AppColor.black),
            middleText:
                "Without any address we can\'t deliver this order to you.\n Otherwise you can still drive through and get it yourself",
            middleTextStyle: Theme.of(context).textTheme.caption,
            confirm: CustomButton(
                buttonBody: "Add Address",
                onTap: () => Get.offNamed(AppRoute.address),
                buttonWidth: 200));
      }
    }
    handleOrderButton();
    update();
  }

  void chooseAddress(int index) {
    selectedAddress = index;
    handleOrderButton();
    update();
  }

  handleOrderButton() {
    if (paymentMethod.isNotEmpty && dilveryMethod.isNotEmpty) {
      if (isDelivery == true && selectedAddress != null) {
        canPlaceOrder = true;
      } else if (isDelivery == false) {
        canPlaceOrder = true;
      } else {
        canPlaceOrder = false;
      }
    }
  }

  void placeOrder() async {
    statusRequest = StatusRequest.loading;
    update();
    // ignore: prefer_typing_uninitialized_variables
    var response;
    if (isDelivery == false) {
      response = await ordersData.placeOrder(authBox.get(HiveKeys.idKey),
          paymentMethod, dilveryMethod, "$totalPrice", "0");
    } else {
      response = await ordersData.placeOrder(
        authBox.get(HiveKeys.idKey),
        paymentMethod,
        dilveryMethod,
        "$totalPrice",
        addressList[selectedAddress!].addressId,
      );
    }
    statusRequest = handilingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.mainPage);
        Get.snackbar("success", "your order have been placed successfully");
      }
    }
  }

  @override
  void onInit() {
    getAddress();
    super.onInit();
  }
}
