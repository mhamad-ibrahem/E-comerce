import 'dart:async';
import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:ecommerce/Core/services/Services.dart';
import 'package:get/get.dart';
import '../../../Core/classes/statusRequest.dart';
import '../../../Core/functions/handilingData.dart';
import '../../../Core/functions/warningAuthDialog.dart';
import '../../../data/DataSource/remote/Auth/vertifaycodeData.dart';

abstract class VertificationController extends GetxController {
  void otpValidate(String vertifaycode);
  onExit();
}

class VertificationImplement extends VertificationController {
  VertifaycodeData vertifaycodeData = VertifaycodeData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  String? email;
  Services services = Get.find();
  Timer? timer;
  int remainingSeconds =1;
  int times = 30;
  bool activitButton = false;
  @override
  void otpValidate(String vertifaycode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await vertifaycodeData.postData(vertifaycode,email!);
    statusRequest = handilingData(response);
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.offAllNamed(AppRoute.signIn);
      } else {
        warningAuthDialog( 'Otp number is not correct');
        statusRequest = StatusRequest.faliure;
      }
    }
    update();
  }
  resendCode(){
    vertifaycodeData.resendCode(email!);
    startTimer(30);
  }
   startTimer(int seconds) {
    const duration = Duration(seconds: 1);
    remainingSeconds = seconds;
    timer = Timer.periodic(duration, (time) {
      if (remainingSeconds == 0) {
        times = remainingSeconds;
        activitButton = true;
        time.cancel();
        update();
      } else {
        times = remainingSeconds;
        remainingSeconds--;
        activitButton = false;
        update();
      }
    });
    update();
  }
   @override
  void onReady() {
    startTimer(30);
    super.onReady();
  }
  @override
  void onClose() {
    if (timer != null) {
      timer!.cancel();
    }
    super.onClose();
  }

  @override
  onExit() {
    Get.offAllNamed(AppRoute.signIn);
  }
  @override
  void onInit() {
    email = Get.arguments["email"];
    super.onInit();
  }
}
