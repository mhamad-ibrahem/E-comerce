import 'package:ecommerce/Core/Constant/apiLinks.dart';
import 'package:ecommerce/Core/classes/Crud.dart';

class NotififcationsData {
  Crud crud;
  NotififcationsData(this.crud);

  getData(String userId) async {
    var response = await crud.postData(AppLinks.notificationLink, {
      "userId": userId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
