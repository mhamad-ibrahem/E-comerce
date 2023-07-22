import 'package:ecommerce/data/DataSource/remote/Cart/CartData.dart';
import 'package:ecommerce/data/model/cart/cartModel.dart';
import 'package:ecommerce/data/model/coupon/couponModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../../Core/Constant/routes.dart';
import '../../Core/classes/HiveBox.dart';
import '../../Core/classes/HiveKeys.dart';
import '../../Core/classes/statusRequest.dart';
import '../../Core/functions/handilingData.dart';
import '../../Core/services/Services.dart';

class CartController extends GetxController {
  Box authBox = Hive.box(HiveBox.authBox);
  List<CartModel> cartDataList = [];
  MyCartData cartData = MyCartData(Get.find());
  StatusRequest statusRequest = StatusRequest.loading;
  Services services = Get.find();
  int? totoalCountItems;
  int countItems = 0;
  int discountCoupon = 0;
  String? couponName;
  double totalPrice = 0.0;
  CouponModel? couponModel;
  TextEditingController coupon = TextEditingController();

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  resetVariableValue() {
    totalPrice = 0.0;
    totoalCountItems = 0;
    cartDataList.clear();
  }

  refreshView() {
    resetVariableValue();
    getData();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.viewCartData(authBox.get(HiveKeys.idKey));
    statusRequest = handilingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        if (response["dataCart"]['status'] == 'success') {
          List responseData = response["dataCart"]['data'];
          Map dataResponseCountPrice = response['countPrice'];
          cartDataList.clear();
          cartDataList.addAll(responseData.map((e) => CartModel.fromJson(e)));
          totoalCountItems = int.parse(dataResponseCountPrice['totalCount']);
          totalPrice = double.parse(dataResponseCountPrice['totalPrice']);
        } else {
          statusRequest = StatusRequest.faliure;
          update();
        }
      }
    }
    update();
  }

  addToCart(String itemId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await cartData.addCartData(authBox.get(HiveKeys.idKey), itemId);
    statusRequest = handilingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        print('==============================');
        print(cartDataList);
      } else {
        statusRequest = StatusRequest.faliure;
      }
    }
    update();
  }

  removeFromCart(String itemId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await cartData.deleteCartData(authBox.get(HiveKeys.idKey), itemId);
    statusRequest = handilingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        print('==============================');
        print(cartDataList);
      } else {
        statusRequest = StatusRequest.faliure;
      }
    }
    update();
  }

  checkCoupon() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.checkCoupon(coupon.text);
    statusRequest = handilingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Map<String, dynamic> dataCoupon = response['data'];
        couponModel = CouponModel.fromJson(dataCoupon);
        discountCoupon = int.parse(couponModel!.couponDiscount);
        couponName = couponModel!.couponName;
        Get.snackbar("Coupon Active", "check discount on the product ");
        print('==============================');
      } else {
        discountCoupon = 0;
        couponName = null;
      }
    }
    update();
  }

  getTotalPrice() {
    return (totalPrice - totalPrice * discountCoupon / 100);
  }

  goToCheckout() {
    Get.toNamed(AppRoute.checkOut, arguments: {'totalPrice': totalPrice});
  }
}
