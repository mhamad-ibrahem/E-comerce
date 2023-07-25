import 'dart:io';

import 'package:ecommerce/Core/Constant/apiLinks.dart';
import 'package:ecommerce/Core/classes/Crud.dart';

class ProfileData {
  Crud crud;
  ProfileData(this.crud);

  getData(String userId) async {
    var response =
        await crud.postData(AppLinks.profileLink, {'userId': userId});
    return response.fold((l) => l, (r) => r);
  }

  editProfile({
    required String userId,
    required String name,
    required String email,
    required String phone,
    required String address,
    required String password,
    required String? oldImageName,
    required File image,
  }) async {
    var response = await crud.multiPartRequest(
        AppLinks.updateProfileLink,
        {
          'id': userId,
          'name': name,
          'email': email,
          'phone': phone,
          'address': address,
          'password': password,
          'imageoldname': oldImageName,
        },
        image);
    return response.fold((l) => l, (r) => r);
  }
}
