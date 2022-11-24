import 'package:ecommerce/model/Poducts.dart';
import 'package:ecommerce/view/Chat/Chat.dart';
import 'package:ecommerce/view/Detailes/Detailes.dart';
import 'package:ecommerce/view/Favourite/Favourite.dart';

import 'package:ecommerce/view/Home/HomePage.dart';
import 'package:ecommerce/view/Profile/Profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  int currentindex = 0;
  List<Widget> bottomPages = [
    HomePage(),
    FavouritePage(),
    ChatPage(),
    ProfilePage()
  ];
  changePage(int value) {
    currentindex = value;
    update();
  }

  List<PopularProducts> popularProduct = [
    PopularProducts(
        id: 'joy', image: 'assets/images/Image Popular Product 1.png'),
    PopularProducts(
        id: 'short', image: 'assets/images/Image Popular Product 2.png'),
    PopularProducts(
        id: 'hat', image: 'assets/images/Image Popular Product 3.png')
  ];
  productDetailes(int i) {
    Get.to(() => ProductsDetailes(), arguments: {
      'id': popularProduct[i].id,
      'image': popularProduct[i].image
    });
  }
}
