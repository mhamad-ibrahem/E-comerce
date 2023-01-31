import 'package:ecommerce/Core/Constant/apiLinks.dart';
import 'package:ecommerce/Core/classes/Crud.dart';

class VertifaycodeData {
  Crud crud;
  VertifaycodeData(this.crud);

  postData(String vertifaycode, String email) async {
    var response = await crud.postData(AppLinks.vertifayLink, {
      'email': email,
      'vertifaycode': vertifaycode,
    });
    return response.fold((l) => l, (r) => r);
  }

  resendCode(String email) async {
    var response = await crud.postData(AppLinks.resendCodeLink, {
      'email': email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
