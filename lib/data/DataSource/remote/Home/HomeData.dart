

import 'package:ecommerce/Core/Constant/apiLinks.dart';
import 'package:ecommerce/Core/classes/Crud.dart';

class HomeData{
  
  Crud crud;
  HomeData(this.crud);

  getData(String userId)async{
    var response = await crud.postData(AppLinks.homeLink, {
      "userid":userId

    });
   return response.fold((l) => l, (r) => r);
  }
  searchData(String searchData)async{
    var response = await crud.postData(AppLinks.searchLink, {
      "searchData": searchData
    });
   return response.fold((l) => l, (r) => r);
  }
  

}