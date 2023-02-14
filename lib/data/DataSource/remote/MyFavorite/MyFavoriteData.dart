import 'package:ecommerce/Core/Constant/apiLinks.dart';
import 'package:ecommerce/Core/classes/Crud.dart';

class MyFavoriteData {
  Crud crud;
  MyFavoriteData(this.crud);

  viewFavorite(String userId) async {
    var response = await crud
        .postData(AppLinks.viewFavoriteData, {"favoriteUserId": userId});
    return response.fold((l) => l, (r) => r);
  }

  deleteFavorite(String favoriteId) async {
    var response = await crud
        .postData(AppLinks.deleteFavoriteData, {"favoriteId": favoriteId});
    return response.fold((l) => l, (r) => r);
  }
}
