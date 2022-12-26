


import 'package:ecommerce/Core/Constant/apiLinks.dart';
import 'package:ecommerce/Core/classes/Crud.dart';

class ResetPasswordData {
  Crud crud;
 ResetPasswordData (this.crud);

  postData( String email , String password) async {
    var response = await crud.postData(AppLinks.resetPasswordLink, {
      'email': email,
      'password':password
    });
    return response.fold((l) => l, (r) => r);
  }
}
