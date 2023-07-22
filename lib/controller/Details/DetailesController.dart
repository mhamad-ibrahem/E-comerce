import 'package:ecommerce/Core/Constant/Colors.dart';
import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:ecommerce/Core/classes/HiveBox.dart';
import 'package:ecommerce/data/DataSource/remote/Favorite/FavoriteData.dart';
import 'package:ecommerce/data/model/Home/Items/ItemsModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:ecommerce/data/DataSource/remote/Cart/CartData.dart';
import '../../Core/classes/HiveKeys.dart';
import '../../Core/classes/statusRequest.dart';
import '../../Core/functions/handilingData.dart';
import '../../Core/services/Services.dart';

abstract class DetailesController extends GetxController {
  addTofavorite(String itemId);
  removeFromfavorite(String itemId);
  changeRating(double rate);
  changeColor(Color selctedColor);
  changeReadMore();
  initialData();
  increaseQuantity();
  decreaseQuantity();
  goToCart();
}

class DetailesControllerImplement extends DetailesController {
  Box authBox = Hive.box(HiveBox.authBox);
  double? itemRating;
  int countItems = 0;
  ItemsModel itemsModel = Get.arguments['itemModel'];
  FavoriteData favoriteData = FavoriteData(Get.find());
  StatusRequest? statusRequest;
  Services services = Get.find();
  MyCartData cartData = MyCartData(Get.find());
  // String isInFavorite = itemsModel.isFavorite!;
  bool isReadmore = false;
  List<Color> itemColor = [
    AppColor.orange,
    AppColor.cyan,
    AppColor.green,
    AppColor.darkPink,
    AppColor.bluePurpleM,
  ];
  DefaultCacheManager manager = DefaultCacheManager();
  Color? activeColor;
  @override
  void onInit() {
    initialData();
    print('**********************');
    print(itemsModel.isFavorite);
    itemRating ??= 1;
    activeColor = itemColor[0];
    super.onInit();
  }

  @override
  initialData() async {
    statusRequest = StatusRequest.loading;
    countItems = await getItemCount(itemsModel.itemId!);
    statusRequest = StatusRequest.success;
    update();
  }

  @override
  decreaseQuantity() {
    if (countItems > 0) {
      removeFromCart(itemsModel.itemId!);
      countItems--;
      update();
    }
  }

  @override
  increaseQuantity() {
    addToCart(itemsModel.itemId!);
    countItems++;
    update();
  }

  @override
  addTofavorite(itemId) async {
    print('**********************=============');
    print(itemsModel.isFavorite);
    statusRequest = StatusRequest.loading;
    var response =
        await favoriteData.addFavorite(authBox.get(HiveKeys.idKey), itemId);
    statusRequest = handilingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        itemsModel.isFavorite = '1';
        update();
        print('======================');
        print(itemsModel.isFavorite);
        Get.snackbar("Der ${authBox.get(HiveKeys.userNameKey)} ",
            "This product add to favorite",
            backgroundColor: AppColor.white);
      } else {
        statusRequest = StatusRequest.faliure;
      }
    }
  }

  @override
  removeFromfavorite(String itemId) async {
    print('**********************=============');
    print(itemsModel.isFavorite);
    statusRequest = StatusRequest.loading;
    var response =
        await favoriteData.removeFavorite(authBox.get(HiveKeys.idKey), itemId);
    statusRequest = handilingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        itemsModel.isFavorite = '0';
        update();
        Get.snackbar("Der ${authBox.get(HiveKeys.userNameKey)} ",
            "This product remove from favorite",
            backgroundColor: AppColor.white);
      } else {
        statusRequest = StatusRequest.faliure;
      }
    }
  }

  @override
  changeRating(double rate) {
    itemRating = rate;
  }

  @override
  changeColor(Color selctedColor) {
    activeColor = selctedColor;
    print(activeColor);
    update();
  }

  @override
  changeReadMore() {
    isReadmore = !isReadmore;
    print(isReadmore);
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
        // print(cartDataList);
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
      } else {
        statusRequest = StatusRequest.faliure;
      }
    }
    update();
  }

  getItemCount(String itemId) async {
    statusRequest = StatusRequest.loading;
    var response =
        await cartData.getCountCartData(authBox.get(HiveKeys.idKey), itemId);
    statusRequest = handilingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        countItems = 0;
        countItems = int.parse(response['data']);
        print('==============================');
        print(countItems);
        return countItems;
      } else {
        statusRequest = StatusRequest.faliure;
      }
    }
    update();
  }

  @override
  goToCart() {
    Get.toNamed(AppRoute.cart);
  }
}
