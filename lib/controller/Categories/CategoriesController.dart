import 'package:ecommerce/Core/Constant/ScreenSize.dart';
import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:ecommerce/data/DataSource/remote/categories/categoriesData.dart';
import 'package:ecommerce/data/model/Home/Items/ItemsModel.dart';
import 'package:get/get.dart';

import '../../Core/classes/statusRequest.dart';
import '../../Core/functions/handilingData.dart';

abstract class CategoriesController extends GetxController {
  initialData();
  changeSelectedCategory(int selcted, String catid);
  getItemsData(String catId);
  goToDetails(ItemsModel itemsModel);
}

class CategoriesControllerImplement extends CategoriesController {
  List? categories;
  int? selectedCategory;
  List itemsList = [];
  String? categoryId;
  CategoriesData categoriesData = CategoriesData(Get.find());
  StatusRequest? statusRequest;

  @override
  initialData() {
    categories = Get.arguments['categories'];
    selectedCategory = Get.arguments['selcetedCategories'];
    categoryId = Get.arguments['categoryId'];
    getItemsData(categoryId!);
  }

  @override
  changeSelectedCategory(selcted, catid) {
    selectedCategory = selcted;
    categoryId = catid; //take new categories value when we switch
    getItemsData(categoryId!);
    update();
  }

  @override
  getItemsData(catId) async {
    itemsList.clear();
    statusRequest = StatusRequest.loading;
    var response = await categoriesData.getData(catId);
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
