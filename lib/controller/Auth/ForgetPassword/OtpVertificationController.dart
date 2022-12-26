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

  @override
  void onInit() {
    email = Get.arguments["email"];
    super.onInit();
  }
}
