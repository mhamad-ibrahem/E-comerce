
import 'package:ecommerce/Core/Constant/apiLinks.dart';
import 'package:ecommerce/Core/classes/Crud.dart';

class CheckemailData {
  Crud crud;
  CheckemailData(this.crud);

  postData( String email) async {
    var response = await crud.postData(AppLinks.checkEmailLink, {
      'email': email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
