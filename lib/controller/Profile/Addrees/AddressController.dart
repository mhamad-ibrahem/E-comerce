import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:ecommerce/data/DataSource/remote/Address/AddressData.dart';
import 'package:ecommerce/data/model/addess/addressModel.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../../../Core/classes/HiveBox.dart';
import '../../../Core/classes/HiveKeys.dart';
import '../../../Core/classes/statusRequest.dart';
import '../../../Core/functions/handilingData.dart';

abstract class AddreessController extends GetxController {
  goToMapAddress();
  viewAddress();
  deleteAddress(String addressId);
}

class AddreessControllerImplement extends AddreessController {
  StatusRequest? statusRequest;
  AddressData addressData = AddressData(Get.find());
  Box authBox = Hive.box(HiveBox.authBox);
  List<AddressModel> addressList = [];
  @override
  goToMapAddress() {
    Get.toNamed(AppRoute.mapLocation);
  }

  @override
  viewAddress() async {
    statusRequest = StatusRequest.loading;
    var response = await addressData.viewAddress(authBox.get(HiveKeys.idKey));
    statusRequest = handilingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List responsedata = response['data'];
        addressList.addAll(responsedata.map((e) => AddressModel.fromJson(e)));
        print(addressList);
        if (addressList.isEmpty) {
          statusRequest = StatusRequest.faliure;
        }
      } else {
        statusRequest = StatusRequest.faliure;
      }
    }
    update();
  }

  @override
  void onInit() {
    viewAddress();
    super.onInit();
  }

  @override
  deleteAddress(addressId) {
    addressData.deleteAddress(addressId);
    addressList.removeWhere((element) => element.addressId == addressId);
    if (addressList.isEmpty) {
      statusRequest = StatusRequest.faliure;
    }
    update();
  }
}
