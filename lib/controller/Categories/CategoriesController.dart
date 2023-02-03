import 'package:ecommerce/Core/Constant/ScreenSize.dart';
import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:ecommerce/Core/classes/HiveBox.dart';
import 'package:ecommerce/Core/classes/HiveKeys.dart';
import 'package:ecommerce/Core/services/Services.dart';
import 'package:ecommerce/data/DataSource/remote/categories/categoriesData.dart';
import 'package:ecommerce/data/model/Home/Items/ItemsModel.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

import '../../Core/classes/statusRequest.dart';
import '../../Core/functions/handilingData.dart';

abstract class CategoriesController extends GetxController {
  initialData();
  changeSelectedCategory(int selcted, String catid);
  getItemsData(String catId,String userId);
  goToDetails(ItemsModel itemsModel);
}

class CategoriesControllerImplement extends CategoriesController {
  Box? authBox;
  List? categories;
  int? selectedCategory;
  List itemsList = [];
  String? categoryId;
  CategoriesData categoriesData = CategoriesData(Get.find());
  StatusRequest? statusRequest;
  Services services = Get.find();
 

  @override
  initialData() {
    categories = Get.arguments['categories'];
    selectedCategory = Get.arguments['selcetedCategories'];
    categoryId = Get.arguments['categoryId'];
    authBox=Get.arguments['authBox'];
    getItemsData(categoryId!,authBox!.get(HiveKeys.idKey));
  }

  @override
  changeSelectedCategory(selcted, catid) {
    selectedCategory = selcted;
    categoryId = catid; //take new categories value when we switch
    getItemsData(categoryId!,authBox!.get(HiveKeys.idKey));
    update();
  }

  @override
  getItemsData(catId,userId) async {
    itemsList.clear();
    statusRequest = StatusRequest.loading;
    var response =
        await categoriesData.getData(catId,authBox!.get(HiveKeys.idKey));
    statusRequest = handilingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        itemsList.addAll(response['data']);
        print('==============================');
      } else {
        statusRequest = StatusRequest.faliure;
      }
    }
    update();
  }

  @override
  void onInit() {
     initialData();
    super.onInit();
  }

  @override
  goToDetails(itemsModel) {
    Get.toNamed(AppRoute.details, arguments: {"itemModel": itemsModel});
  }
}
