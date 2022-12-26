
import 'package:ecommerce/Core/Constant/apiLinks.dart';
import 'package:ecommerce/Core/classes/Crud.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);

  postData( String email, String password) async {
    var response = await crud.postData(AppLinks.loginLink, {
      'password': password,
      'email': email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
