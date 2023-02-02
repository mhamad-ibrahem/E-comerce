import 'package:ecommerce/Core/Constant/apiLinks.dart';
import 'package:ecommerce/Core/classes/Crud.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);

  addFavorite(String userId, String itemId) async {
    var response = await crud.postData(AppLinks.addTofavorite,
        {"userId": userId, "itemId": itemId});
    return response.fold((l) => l, (r) => r);
  }
    removeFavorite(String userId, String itemId) async {
    var response = await crud.postData(AppLinks.addTofavorite,
        {"userId": userId, "itemId": itemId});
    return response.fold((l) => l, (r) => r);
  }
}
