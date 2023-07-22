import 'package:ecommerce/Core/classes/HiveBox.dart';
import 'package:ecommerce/Core/classes/HiveKeys.dart';
import 'package:ecommerce/Core/classes/statusRequest.dart';
import 'package:ecommerce/Core/functions/handilingData.dart';
import 'package:ecommerce/data/DataSource/remote/orders/OrdersData.dart';
import 'package:ecommerce/data/model/orders/orderModel.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class OrderController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;
  OrdersData ordersData = OrdersData(Get.find());
  Box authBox = Hive.box(HiveBox.authBox);
  List<OrdersModel> ordersList = [];
  List<String> orderStatus = [
    "Pending approval",
    "order preparing",
    "being shipped",
    "delivered successfully"
  ];
  getOrders() async {
    var response = await ordersData.getOrders(authBox.get(HiveKeys.idKey));

    statusRequest = handilingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List tempOrdersList = response['data'];
        ordersList =
            tempOrdersList.map((e) => OrdersModel.fromJson(e)).toList();
      } else {
        statusRequest = StatusRequest.faliure;
      }
    }

    update();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
