import 'package:ecommerce/Core/Constant/apiLinks.dart';
import 'package:ecommerce/Core/classes/Crud.dart';

class OrdersData {
  Crud crud;
  OrdersData(this.crud);

  getOrders(String userId) async {
    var response = await crud.postData(AppLinks.getOrders, {"userId": userId});
    return response.fold((l) => l, (r) => r);
  }

  placeOrder(
    String userId,
    String paymentType,
    String type,
    String price,
    String addressId,
  ) async {
    var response = await crud.postData(AppLinks.addOrder, {
      "userId": userId,
      "addressId": addressId,
      "paymentType": paymentType,
      "type": type,
      "price": price
    });
    return response.fold((l) => l, (r) => r);
  }
}
