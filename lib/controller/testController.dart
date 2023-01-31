
import 'package:ecommerce/Core/classes/statusRequest.dart';
import 'package:ecommerce/data/DataSource/remote/testData.dart';
import 'package:get/get.dart';
import 'dart:async';
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




class TimerController extends GetxController {
  Timer? timer;
  int remainingSeconds =1;
  int times = 5;
  @override
  void onReady() {
    startTimer(5);
    super.onReady();
  }

  startTimer(int seconds) {
    const duration = Duration(seconds: 1);
    remainingSeconds = seconds;
    timer = Timer.periodic(duration, (time) {
      if (remainingSeconds == 0) {
        times = remainingSeconds;
        time.cancel();
        update();
      } else {
        times = remainingSeconds;
        remainingSeconds--;
        update();
      }
    });
    update();
  }

  @override
  void onClose() {
    if (timer != null) {
      timer!.cancel();
    }
    super.onClose();
  }
}
