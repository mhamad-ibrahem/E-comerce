import 'package:ecommerce/data/model/Poducts.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Core/Constant/Colors.dart';

class DetailesController extends GetxController {
  //Products List
  List<Product> products = [];
  //Dot Colors List
  List<Color> dotcolors = [red, bluePurpled, thirdDotColor, white];
  //Change upper image
  int chosenImage = 0;
  changeChosenImage(int index) {
    chosenImage = index;
    update();
  }

  //See More Text from Description
  int maxlines = 3;
  bool showDetailVisiablility = true;
  double height = 70;
  seeMoreDetail() {
    maxlines = 10;
    showDetailVisiablility = false;
    height = height * 2;

    update();
  }

  //Favourite Button
  bool isFavourite = false;
  addOrRemoveFromFavourite() {
    isFavourite = !isFavourite;
    update();
  }

  //Change product Color
  String color = 'white';
  int chosenColor = 3;
  changeChosenColor(int index) {
    chosenColor = index;
    if (chosenColor == 0) {
      color = 'red';
    }
    if (chosenColor == 1) {
      color = 'blue';
    }
    if (chosenColor == 2) {
      color = 'gold';
    }
    if (chosenColor == 3) {
      color = 'white';
    }
    products = [
      Product(
          oldid: '1',
          rate: 4.5,
          name: 'Wireless Controller for PS4',
          description:
              'Wireless Controller for PS4 gives you what you want in your gaming from over precision control your games sharing and it last for several hours without needing to recharge',
          images: [
            'assets/images/ps4_console_${color}_1.png',
            'assets/images/ps4_console_${color}_2.png',
            'assets/images/ps4_console_${color}_3.png',
            'assets/images/ps4_console_${color}_4.png'
          ])
    ];
    update();
  }

  //Change Quantity
  int quantity = 0;
  increaseQuantity() {
    quantity++;
    update();
  }

  decreaseQuantity() {
    if (quantity > 0) {
      quantity--;
      update();
    }
  }

  @override
  void onInit() {
    products = [
      Product(
          oldid: '1',
          rate: 4.5,
          name: 'Wireless Controller for PS4',
          description:
              'Wireless Controller for PS4 gives you what you want in your gaming from over precision control your games sharing and it last for several hours without needing to recharge',
          images: [
            'assets/images/ps4_console_${color}_1.png',
            'assets/images/ps4_console_${color}_2.png',
            'assets/images/ps4_console_${color}_3.png',
            'assets/images/ps4_console_${color}_4.png'
          ])
    ];
    super.onInit();
  }
}
