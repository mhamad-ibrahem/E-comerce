import 'dart:async';
import 'package:ecommerce/Core/classes/statusRequest.dart';
import 'package:ecommerce/data/DataSource/remote/Auth/Forget%20Password/vertifayPasswordData.dart';
import 'package:get/get.dart';
import '../../../Core/Constant/routes.dart';
import '../../../Core/functions/handilingData.dart';
import '../../../Core/functions/warningAuthDialog.dart';

abstract class OtpVertificationController extends GetxController {
  void otpValidate(String vertifaycode);
}

class OtpVertificationPasswordImplement extends OtpVertificationController {
  StatusRequest statusRequest = StatusRequest.none;
  VertifayPasswordData vertifayPasswordData = VertifayPasswordData(Get.find());
  String? email;
  Timer? timer;
  int remainingSeconds =1;
  int times = 30;
  bool activitButton = false;
  
  @override
  void otpValidate(String vertifaycode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await vertifayPasswordData.postData(email!, vertifaycode);
    statusRequest = handilingData(response);
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        // data.add(response['data']);
        Get.offNamed(AppRoute.resetPasswordPage, arguments: {"email": email});
      } else {
        warningAuthDialog('Otp number is not correct');
        statusRequest = StatusRequest.faliure;
      }
    }
  }
  resendCode(){
   vertifayPasswordData.resendCode(email!);
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
  void onInit() {
    email = Get.arguments["email"];
    super.onInit();
  }
}
