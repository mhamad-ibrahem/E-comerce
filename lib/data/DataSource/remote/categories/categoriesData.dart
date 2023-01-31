
import 'package:ecommerce/Core/Constant/apiLinks.dart';
import 'package:ecommerce/Core/classes/Crud.dart';

class CategoriesData{
  
  Crud crud;
  CategoriesData(this.crud);

  getData(String categoriesId)async{
    var response = await crud.postData(AppLinks.itemsLink, {"categoryid":categoriesId.toString()});
   return response.fold((l) => l, (r) => r);
  }
}