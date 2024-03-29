
import 'package:ecommerce/Core/Constant/apiLinks.dart';
import 'package:ecommerce/Core/classes/Crud.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);

  postData(String username, String email, String password, String phone,
      String location,String token) async {
    var response = await crud.postData(AppLinks.signUpLink, {
      'username': username,
      'password': password,
      'email': email,
      'phone': phone,
      'location': location,
      'token':token,
    });
    return response.fold((l) => l, (r) => r);
  }
}
