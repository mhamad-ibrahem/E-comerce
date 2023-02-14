
import 'package:ecommerce/view/Screens/Chat/Chat.dart';
import 'package:ecommerce/view/Screens/Favourite/Favourite.dart';
import 'package:ecommerce/view/Screens/Home/HomePage.dart';
import 'package:ecommerce/view/Screens/Profile/Profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  int currentindex = 0;
  List<Widget> bottomPages = [
    const HomePage(),
    const FavouritePage(),
    const ChatPage(),
    const ProfilePage()
  ];
  changePage(int value) {
    currentindex = value;
    update();
  }
}
