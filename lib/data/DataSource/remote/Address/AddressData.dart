import 'package:ecommerce/Core/Constant/apiLinks.dart';
import 'package:ecommerce/Core/classes/Crud.dart';

class AddressData {
  Crud crud;
  AddressData(this.crud);

  viewAddress(String userId) async {
    var response =
        await crud.postData(AppLinks.viewAddressLink, {"userId": userId});
    return response.fold((l) => l, (r) => r);
  }

  deleteAddress(String addressId) async {
    var response = await crud
        .postData(AppLinks.deleteAddressLink, {"addressId": addressId});
    return response.fold((l) => l, (r) => r);
  }

  editeAddress(String addressId, String addresscity, String addressstreet,
      String addresslat, String addresslang, String addressname) async {
    var response = await crud.postData(AppLinks.editeAddressLink, {
      "addressId": addressId,
      "city": addresscity,
      "street": addressstreet,
      "lat": addresslat,
      "lang": addresslang,
      "name": addressname
    });
    return response.fold((l) => l, (r) => r);
  }
   addAddress(String userId, String addresscity, String addressstreet,
      String addresslat, String addresslang, String addressname) async {
    var response = await crud.postData(AppLinks.addAddressLink, {
      "userId": userId,
      "city": addresscity,
      "street": addressstreet,
      "lat": addresslat,
      "lang": addresslang,
      "name": addressname
    });
    return response.fold((l) => l, (r) => r);
  }
}
