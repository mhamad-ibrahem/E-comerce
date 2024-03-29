import 'package:ecommerce/Core/Constant/apiLinks.dart';
import 'package:ecommerce/Core/classes/Crud.dart';

class CategoriesData {
  Crud crud;
  CategoriesData(this.crud);

  getData(String categoriesId, String userid) async {
    var response = await crud.postData(AppLinks.itemsLink,
        {"categoryid": categoriesId.toString(), "userid": userid});
    return response.fold((l) => l, (r) => r);
  }

  searchData(String searchData) async {
    var response =
        await crud.postData(AppLinks.searchLink, {"searchData": searchData});
    return response.fold((l) => l, (r) => r);
  }
}
