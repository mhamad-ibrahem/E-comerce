import 'package:ecommerce/Core/Constant/Colors.dart';
import 'package:ecommerce/data/model/Home/Items/ItemsModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';

abstract class DetailesController extends GetxController {
  increaseQuantity();
  decreaseQuantity();
  addTofavorite();
  changeRating(double rate);
  changeColor(Color selctedColor);
  changeReadMore();
}

class DetailesControllerImplement extends DetailesController {
  int quantity = 0;
  bool isInFavorite = false;
  double? itemRating;
  ItemsModel itemsModel = Get.arguments['itemModel'];
  bool isReadmore = false;
  List<Color> itemColor = [
    AppColor.lightGrey,
    AppColor.cyan,
    AppColor.green,
    AppColor.darkPink,
    AppColor.blue,
  ];
  DefaultCacheManager manager = DefaultCacheManager();
  Color? activeColor;

  @override
  increaseQuantity() {
    quantity++;
    update();
  }

  @override
  decreaseQuantity() {
    if (quantity > 0) {
      quantity--;
      update();
    }
  }

  @override
  void onInit() {
    itemRating ??= 1;
    activeColor = itemColor[0];
    print(itemRating);
    super.onInit();
  }

  @override
  addTofavorite() {
    isInFavorite = !isInFavorite;
    update();
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
}
