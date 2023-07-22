import 'package:ecommerce/data/DataSource/remote/MyFavorite/MyFavoriteData.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../../Core/classes/HiveBox.dart';
import '../../Core/classes/HiveKeys.dart';
import '../../Core/classes/statusRequest.dart';
import '../../Core/functions/handilingData.dart';
import '../../Core/services/Services.dart';
import '../../data/model/Favorite/FavoriteModel.dart';

abstract class FavoriteController extends GetxController {
  getData();
  deleteFavoriteData(String favoriteId);
}

class FavoriteImplement extends FavoriteController {
  Box authBox = Hive.box(HiveBox.authBox);
  List<FavoriteModel> favoriteDataList = [];
  MyFavoriteData favoriteData = MyFavoriteData(Get.find());
  StatusRequest? statusRequest;
  Services services = Get.find();
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  @override
  deleteFavoriteData(favoriteId) {
    var response = favoriteData.deleteFavorite(favoriteId);
    favoriteDataList.removeWhere((element) => element.favoriteId == favoriteId);
    update();
  }

  @override
  getData() async {
    favoriteDataList.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.viewFavorite(authBox.get(HiveKeys.idKey));
    statusRequest = handilingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List responseData = response["data"];
        favoriteDataList =
            responseData.map((e) => FavoriteModel.fromJson(e)).toList();
        print('==============================');
        print(favoriteDataList);
      } else {
        statusRequest = StatusRequest.faliure;
      }
    }
    update();
  }
}
