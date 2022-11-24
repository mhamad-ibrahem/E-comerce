import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Constant/Colors.dart';
import 'controller/HomePageController.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  final HomePageController homePageController =
      Get.put(HomePageController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: GetBuilder<HomePageController>(
        builder: (controller) => BottomNavigationBar(
            currentIndex: controller.currentindex,
            onTap: (val) => controller.changePage(val),
            selectedItemColor: orange,
            unselectedItemColor: deepGrey,
            backgroundColor: lightGrey,
            enableFeedback: false,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.storefront_outlined),
                label: '.',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_outline_outlined), label: '.'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.chat_outlined,
                  ),
                  label: '.'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline_outlined), label: '.')
            ]),
      ),
      body: GetBuilder<HomePageController>(
        builder: (controller) =>
            controller.bottomPages.elementAt(controller.currentindex),
      ),
    ));
  }
}
