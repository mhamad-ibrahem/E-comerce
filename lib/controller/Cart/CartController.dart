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
  int countItems = 0;
  double totalPrice =0.0;
  void onInit() {
    getData();
    super.onInit();
  }

  resetVariableValue() {
    totalPrice = 0.0;
    totoalCountItems = 0;
    cartDataList.clear();
  }

  refreshView() {
    resetVariableValue();
    getData();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.viewCartData(authBox.get(HiveKeys.idKey));
    statusRequest = handilingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
       if(response["dataCart"]['status']=='success'){
         List responseData = response["dataCart"]['data'];
        Map dataResponseCountPrice = response['countPrice'];
        cartDataList.clear();
        cartDataList.addAll(responseData.map((e) => CartModel.fromJson(e)));
        totoalCountItems = int.parse(dataResponseCountPrice['totalCount']);
        totalPrice = double.parse(dataResponseCountPrice['totalPrice']);
        print('==============================');
        print(cartDataList);
       }
      } else {
        statusRequest = StatusRequest.faliure;
      }
    }
    update();
  }

  addToCart(String itemId) async {
    statusRequest = StatusRequest.loading;
    update();
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

  removeFromCart(String itemId) async {
    statusRequest = StatusRequest.loading;
    update();
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

}
