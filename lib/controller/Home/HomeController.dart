import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:ecommerce/data/DataSource/remote/Home/HomeData.dart';
import 'package:get/get.dart';
import '../../Core/classes/statusRequest.dart';
import '../../Core/functions/handilingData.dart';
import '../../data/model/Home/Items/ItemsModel.dart';

abstract class HomeController extends GetxController {
  getData();
  goToCategoriesPage(List categories, int selcetedCategorie, String categoryId);
  goToDetails(ItemsModel itemsModel);
}

class HomeControllerImplement extends HomeController {
  HomeData homeData = HomeData(Get.find());
  List categoriesList = [];
  List itemsList = [];
  List popularItems = [];
  StatusRequest? statusRequest;

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
    super.onInit();
  }

  @override
  goToCategoriesPage(categories, selcetedCategorie, categoryId) {
    Get.toNamed(AppRoute.categories, arguments: {
      "categories": categories,
      "selcetedCategories": selcetedCategorie,
      "categoryId": categoryId
    });
  }

  @override
  @override
  goToDetails(itemsModel) {
    Get.toNamed(AppRoute.details, arguments: {"itemModel": itemsModel});
  }
}
