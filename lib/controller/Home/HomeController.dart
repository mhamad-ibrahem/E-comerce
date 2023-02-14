import 'package:ecommerce/Core/Constant/Colors.dart';
import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:ecommerce/data/DataSource/remote/Home/HomeData.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import '../../Core/classes/HiveBox.dart';
import '../../Core/classes/statusRequest.dart';
import '../../Core/functions/handilingData.dart';
import '../../data/model/Home/Items/ItemsModel.dart';

abstract class HomeController extends GetxController {
  getData();
  goToCategoriesPage(List categories, int selcetedCategorie, String categoryId);
  goToDetails(ItemsModel itemsModel);
  openAuthBox();
}

class HomeControllerImplement extends HomeController {
  Box authBox = Hive.box(HiveBox.authBox);
  HomeData homeData = HomeData(Get.find());
  List categoriesList = [];
  List itemsList = [];
  List popularItems = [];
  StatusRequest? statusRequest;
  @override
  openAuthBox() async {
    authBox = await Hive.openBox(HiveBox.authBox);
    print(Hive.openBox(HiveBox.authBox));
  }
   initialMessage() async {
    //work when app is closed
    var message = await FirebaseMessaging.instance.getInitialMessage();
    if (message != null) {
      Get.toNamed(AppRoute.signUp);
    }
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    statusRequest = handilingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        categoriesList.addAll(response['categories']);
        itemsList.addAll(response['items']);
        popularItems.addAll(response['popularitems']);
        print('==============================');
        print(categoriesList.length);
        print(categoriesList);
      } else {
        statusRequest = StatusRequest.faliure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    initialMessage();
    FirebaseMessaging.instance.getToken().then((value) {
      //work when app is background state
      print(value);
      String? token = value;
      FirebaseMessaging.onMessageOpenedApp.listen((event) {
        Get.toNamed(AppRoute.signUp);
      });
      FirebaseMessaging.onMessage.listen((event) {
        //work when app is open
        Get.snackbar(
          backgroundColor: AppColor.lightGrey,
            "${event.notification!.title}", "${event.notification!.body}");
        print("${event.notification}");
      });
    });
    openAuthBox();
    super.onInit();
  }

  @override
  goToCategoriesPage(categories, selcetedCategorie, categoryId) {
    Get.toNamed(AppRoute.categories, arguments: {
      "authBox": authBox,
      "categories": categories,
      "selcetedCategories": selcetedCategorie,
      "categoryId": categoryId
    });
  }

  @override
  @override
  goToDetails(itemsModel) {
    Get.toNamed(AppRoute.details,
        arguments: {"itemModel": itemsModel});
  }
}
