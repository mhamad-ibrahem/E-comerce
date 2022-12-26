

import 'package:ecommerce/Core/Constant/apiLinks.dart';
import 'package:ecommerce/Core/classes/Crud.dart';

class VertifayPasswordData {
  Crud crud;
  VertifayPasswordData(this.crud);

  postData( String email , String vertifayPassword) async {
    var response = await crud.postData(AppLinks.vertifayPasswordLink, {
      'email': email,
      'vertifaycode':vertifayPassword
    });
    return response.fold((l) => l, (r) => r);
  }
}
