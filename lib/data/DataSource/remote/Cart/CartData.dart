import 'package:ecommerce/Core/Constant/apiLinks.dart';
import 'package:ecommerce/Core/classes/Crud.dart';

class MyCartData {
  Crud crud;
  MyCartData(this.crud);

  viewCartData(String userId) async {
    var response =
        await crud.postData(AppLinks.viewCartData, {"userId": userId});
    return response.fold((l) => l, (r) => r);
  }

  deleteCartData(String userId, String itemId) async {
    var response = await crud.postData(AppLinks.removeCartData, {
      "userId": userId,
      "itemId": itemId,
    });
    return response.fold((l) => l, (r) => r);
  }

  addCartData(String userId, String itemId) async {
    var response = await crud.postData(AppLinks.addCartData, {
      "userId": userId,
      "itemId": itemId,
    });
    return response.fold((l) => l, (r) => r);
  }

  getCountCartData(String userId, String itemId) async {
    var response = await crud.postData(AppLinks.getCountItemCartData, {
      "userId": userId,
      "itemId": itemId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
