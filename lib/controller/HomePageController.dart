import 'package:ecommerce/Core/Constant/imageAsset.dart';
import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:ecommerce/data/model/Poducts.dart';
import 'package:ecommerce/view/Screens/Chat/Chat.dart';
import 'package:ecommerce/view/Screens/Favourite/Favourite.dart';
import 'package:ecommerce/view/Screens/Home/HomePage.dart';
import 'package:ecommerce/view/Screens/Profile/Profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  int currentindex = 0;
  List<Widget> bottomPages = [
    HomePage(),
    const FavouritePage(),
    const ChatPage(),
    const ProfilePage()
  ];
  changePage(int value) {
    currentindex = value;
    update();
  }

  List<PopularProducts> popularProduct = [
    PopularProducts(
        id: 'joy', image: AppImageAsset.popularProductimage1),
    PopularProducts(
        id: 'short', image:  AppImageAsset.popularProductimage2),
    PopularProducts(
        id: 'hat', image:  AppImageAsset.popularProductimage3)
  ];
  productDetailes(int i) {
    Get.toNamed( AppRoute.details, arguments: {
      'id': popularProduct[i].id,
      'image': popularProduct[i].image
    });
  }
}
