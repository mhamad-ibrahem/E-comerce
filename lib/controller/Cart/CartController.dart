import 'package:ecommerce/data/DataSource/remote/Cart/CartData.dart';
import 'package:ecommerce/data/model/cart/cartModel.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../../Core/classes/HiveBox.dart';
import '../../Core/classes/HiveKeys.dart';
import '../../Core/classes/statusRequest.dart';
import '../../Core/functions/handilingData.dart';
import '../../Core/services/Services.dart';

class CartController extends GetxController {
  Box authBox = Hive.box(HiveBox.authBox);
  List<CartModel> cartDataList = [];
  MyCartData cartData = MyCartData(Get.find());
  StatusRequest? statusRequest;
  Services services = Get.find();
  int? totoalCountItems ;
  int countItems =0;
  double? totalPrice;
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.viewCartData(authBox.get(HiveKeys.idKey));
    statusRequest = handilingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List responseData = response["dataCart"];
        cartDataList.addAll(responseData.map((e) => CartModel.fromJson(e)));
        Map dataResponseCountPrice = response['countPrice'];
        totoalCountItems=int.parse(dataResponseCountPrice['totalCount']);
        totalPrice=double.parse(dataResponseCountPrice['totalPrice']);
        print('==============================');
        print(cartDataList);
      } else {
        statusRequest = StatusRequest.faliure;
      }
    }
    update();
  }

  addToCart(String itemId) async {
    statusRequest = StatusRequest.loading;
    var response =
        await cartData.addCartData(authBox.get(HiveKeys.idKey), itemId);
    statusRequest = handilingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        print('==============================');
        print(cartDataList);
      } else {
        statusRequest = StatusRequest.faliure;
      }
    }
    update();
  }
  removeFromCart(String itemId)async{
    statusRequest = StatusRequest.loading;
    var response =
        await cartData.deleteCartData(authBox.get(HiveKeys.idKey), itemId);
    statusRequest = handilingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        print('==============================');
        print(cartDataList);
      } else {
        statusRequest = StatusRequest.faliure;
      }
    }
    update();
  }

  getItemCount(String itemId) async {
    statusRequest = StatusRequest.loading;
    var response =
        await cartData.getCountCartData(authBox.get(HiveKeys.idKey), itemId);
    statusRequest = handilingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        countItems = 0;
        countItems=int.parse(response['data']);
        print('==============================');
        print(countItems);
        return countItems;
      } else {
        statusRequest = StatusRequest.faliure;
      }
    }
    update();
  }
}
