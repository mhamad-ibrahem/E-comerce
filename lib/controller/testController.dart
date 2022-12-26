import 'package:ecommerce/Core/classes/statusRequest.dart';
import 'package:ecommerce/data/DataSource/remote/testData.dart';
import 'package:get/get.dart';

import '../Core/functions/handilingData.dart';

class TestController extends GetxController {
  TestData testData = TestData(Get.find());
  List data = [];
  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await testData.getData();
    statusRequest = handilingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        data.add(response['data']);
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
}
