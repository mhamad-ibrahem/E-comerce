
import 'package:ecommerce/Core/Constant/routes.dart';
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
  @override
  void otpValidate(String vertifaycode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await vertifaycodeData.postData(vertifaycode,email!);
    statusRequest = handilingData(response);
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.offAllNamed(AppRoute.signUpSuccess);
      } else {
        warningAuthDialog( 'Otp number is not correct');
        statusRequest = StatusRequest.faliure;
      }
    }
    update();
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
